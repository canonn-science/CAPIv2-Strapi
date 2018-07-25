/**
 * 
 * SettingsRow
 */

import React from 'react';
import { upperFirst } from 'lodash';
import PropTypes from 'prop-types';
import IcoContainer from 'components/IcoContainer';

import styles from './styles.scss';


function SettingsRow({ destination, name, onClick }) {
  return (
    <div className={styles.settingsRow} onClick={() => onClick(destination)}>
      <div>
        <div className={styles.frame}>
          <div className={styles.icon}>
            <i className="fa fa-cube"></i>
          </div>
          {upperFirst(name)}
        </div>
        <IcoContainer icons={[{ icoType: 'cog', onClick: () => onClick(destination) }]} />
      </div>
    </div>
  );
}

SettingsRow.propTypes = {
  destination: PropTypes.string.isRequired,
  name: PropTypes.string.isRequired,
  onClick: PropTypes.func.isRequired,
};

export default SettingsRow;
