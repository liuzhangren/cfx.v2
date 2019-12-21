import React, { useState, useEffect} from 'react'
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
    customStyle
    className
    value
    max
    size
    margin
  ] = props

  iconStyle = 
    marginRight: Taro.pxTransform margin
  starIconStyle = 
    if fontSize: size then "#{size}px" else ''

  classNameArr = []
  floorValue = Math.floor value
  ceilValue =Math.ceil value
  for (let i=0; i< max; i++)
    if floorValue > i
    then classNameArr.push 'at-rate__icon at-rate__icon--on'
    else if ceilValue - 1 === i
    then classNameArr.push 'at-rate__icon at-rate__icon--half'
    else classNameArr.push 'at-rate__icon at-rate__icon--off'

  C.View
    className: classNames 'at-rate', className
    style: customStyle
  ,
    classNameArr.map (cls, i) =>
      C.View
        className: cls
        key: "at-rate-star-#{i}"
        style: iconStyle
        onClick: handleClick.bind i+1
      ,
        C.Text
          className:'at-icon at-icon-star-2'
          style:starIconStyle
        C.View
          className:'at-rate__left'
        ,
          C.Text
            className: 'at-icon at-icon-star-2' 
            style: starIconStyle