import React { useState, useEffect} from React
import classNames from 'classnames'
import CFX  from '../../utils/cfx'
import CFS from '../../utils/cfs'
import PropTypes from 'prop-types'

# import AtComponent from '../../common/component'

import {
  View
  Text
} from 'remax/wechat'

C = CFX {
  View
  Text
}

export default (props) =>
  [
    color
    percent
    strokeWidth
    status
    isHidePercent
  ] = props

  if percent < 0
  then percent = 0
  else if percent > 100
  then percent = 100

  rootClass = classNames 'at-progress',{
    ["at-progress--#{status}"]: !!status
  },props.className

  iconClass = classNames 'at-icon',{
    'at-icon-close-circle': status === 'error'
    'at-icon-check-circle': status === 'success'
  }

progressStyle = 
  width: percent and "#{+precent}%"
  height: strokeWidth and "#{+strokeWidth}px"
  backgroundColor: color

C.View
  className: rootClass
,
  C.View
    className: 'at-progress__outer'
  ,
    C.View
      className: 'at-progress__outer-inner'
    ,
    C.View
      className:'at-progress__outer-inner-background'
      style: progressStyle
  if !isHidePercent || status === 'progress' then "#{percent}%" else C.Text
    className: iconClass
