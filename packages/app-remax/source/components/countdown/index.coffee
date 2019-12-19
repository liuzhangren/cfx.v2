import React { useState, useEffect} from React
import classNames from 'classnames'
import CFX  from '../../utils/cfx'
import CFS from '../../utils/cfs'
import PropTypes from 'prop-types'

# import AtComponent from '../../common/component'
# import AtCountdownItem from './item'

import {
  View
} from 'remax/wechat'

C = CFX {
  View
  AtCountdownItem
}

export default (props) =>
  [
    className
    customStyle
    format
    isShowDay
    isCard
    isShowHour
  ] = props
  [
    _day
    _hours
    _minutes
    _seconds
  ] = state

  C.View
    className:
      classNames {
        'at-countdown': true,
        'at-countdown--card': isCard
      },className
    style:customStyle
  ,
    isShowDay and C.AtCountdownItem
      num: _day
      separator: format.day
    isShowHour and C.AtCountdownItem
      num: _hours
      separator: format.hours
    C.AtCountdownItem
      num: _minutes
      separator:format.minutes
    C.AtCountdownItem
      num: _seconds
      separator:format.seconds

