// Fetch EDSM Body
import {fetch_retry} from '../script_fetchRetry';

// Fetch EDSM System
export const getEDSM = async (system, type) => {
  var edsmURL;
  if (type === 'system') {
    edsmURL = 'https://www.edsm.net/en/api-v1/system?showId=1&showCoordinates=1&showPrimaryStar=1&systemName=';
  } else if (type === 'body') {
    edsmURL = 'https://www.edsm.net/en/api-system-v1/bodies?systemName=';
  }

  let edsmResponse = await fetch_retry( 5, edsmURL + encodeURIComponent(system),
    {
      method: 'GET',
      headers: {
        Accept: 'application/json',
        'Content-Type': 'application/json',
      },
    }
  );

  let edsmData = null;
  try {
    edsmData = await edsmResponse.json();
  } catch (error) {
    edsmData = {};
    console.log(error);
  }
  return edsmData;
};
