import json
import requests
import pymysql.cursors

from datetime import datetime

"""
Running anywhere needs the following:
pip3 install PyMySQL
pip3 install requests
"""

"""
Edit these
"""
connection = pymysql.connect(host='localhost',
                             port=3306,
                             user='capiv2system',
                             password='capiv2password',
                             db='capiv2_207',
                             charset='utf8',
                             cursorclass=pymysql.cursors.DictCursor)

"""
file_path = 'test.db'
"""
table_name = 'systems'
day_difference_threshold = 1
edsm_api_systems_url = 'https://www.edsm.net/api-v1/systems'

current_date = datetime.now()
names_to_update = []

select_sql = 'SELECT systemName, updated_at FROM `{}`'.format(table_name)

try:
    with connection.cursor() as cursor:
        # Create a new record
        cursor.execute(select_sql)
        result = cursor.fetchall()
        for row in result:
            print(row)
            systemName = row['systemName']
            date_string = row['updated_at']
            date = datetime.strptime(date_string, '%Y-%m-%d %H:%M:%S')
            elapsed_time = current_date - date
            if elapsed_time.days >= day_difference_threshold:
                names_to_update.append(systemName)
        print('Updating {} rows'.format(len(names_to_update)))
        # add the params manually since they're duplicates
        url = edsm_api_systems_url + '?showId=1&showCoordinates=1&showPermit=1&'
        for index, name in enumerate(names_to_update):
            if not index == 0:
                url += '&'
            url += 'systemName[]={}'.format(name)
        response = requests.get(url)
        print(response.status_code)
        all_systems_data = response.json()
        print(all_systems_data)
        with open('data.json', 'w') as file:
            file.write(json.dumps(all_systems_data, indent=4, sort_keys=True))
        for system_data in all_systems_data:
            print(system_data)
            insert_sql = 'UPDATE `{}` SET edsmCoordX=?, edsmCoordY=?, edsmCoordZ=?, edsmCoordLocked=? WHERE systemName LIKE \'{}\''.format(table_name, system_data['name'])
            cursor.execute(
                insert_sql,
                (
                    system_data['coords']['x'],
                    system_data['coords']['y'],
                    system_data['coords']['z'],
                    system_data['coordsLocked']
                )
            )
    connection.commit()
finally:
    connection.close()
