import React { useState, useEffect} from React
import classNames from 'classnames'
import CFX  from '../../utils/cfx'
import CFS from '../../utils/cfs'
import PropTypes from 'prop-types'
import isNaN from 'lodash/isNaN'

# import AtComponent from '../../common/component'

import {
  View
} from 'remax/wechat'

C = CFX {
  View
}

export default (props) =>
  formatValue = (value,maxValue) =>
    if value === '' || value === null
      ''
    numValue = +value
    if isNaN numValue
      value
    if numValue > maxValue then "#{maxValue}" else numValue
  
  [
    dot
    value
    maxValue
    customStyle
  ] = props
  rootClassName = ['at-badge']

  val = formatValue value,maxValue

  C.View
    className: classNames rootClassName,prosp.className
    style: customStyle
  , props.children
    if dot then C.View
      className: 'at-badge__dot'
    else val !== '' and   C.View
      className: 'at-badge__num'
    , val
    

