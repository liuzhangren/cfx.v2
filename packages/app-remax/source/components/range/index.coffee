import React { useState, useEffect} from React
import classNames from 'classnames'
import CFX  from '../../utils/cfx'
import CFS from '../../utils/cfs'
import PropTypes from 'prop-types'

# import { delayQuerySelector, getEventDetail } from '../../common/utils'
# import AtComponent from '../../common/component'


import {
  View
} from 'remax/wechat'

C = CFX {
  View
}

export default (props) =>
  [
    className
    customStyle
    sliderStyle
    railStyle
    trackStyle
    blockSize
    disabled
  ] = props

  rootCls = classNames 'at-range', {
      'at-range--disabled': disabled
    }, className
  
  [aX, bx] = state

  sliderCommonStyle = 
    width: if blockSize then "#{blockSize}PX" else ''
    height: if blockSize then "#{blockSize}PX" else ''
    marginLeft: if blockSize then "#{-blockSize / 2}PX" else ''
  
  sliderAStyle = 
    ...sliderCommonStyle
    left: "#{aX}%"

  containerStyle = 
    height: if blockSize then "#{blockSize}PX" else ''
  
  smallerX = Math.min(aX, bX)
  deltaX = Math.abs(aX - bX)
  atTrackStyle = 
    left: "#{smallerX}%"
    width: "#{deltaX}%"
  
  c.View
    className: rootCls 
    style: customStyle 
    onClick: handleClick
  ,
    C.View
      className: 'at-range__container'
      style: containerStyle
    ,
      C.View
        className: 'at-range__rail' 
        style: railStyle
      C.View
        className: 'at-range__track' 
        style: mergeStyle(atTrackStyle, trackStyle)
      C.View
        className: 'at-range__slider'
        style: mergeStyle(sliderAStyle, sliderStyle)
        onTouchMove: handleTouchMove.bind(this, 'aX')
        onTouchEnd: handleTouchEnd.bind(this, 'aX')
      C.View
        className:'at-range__slider'
        style: mergeStyle(sliderBStyle, sliderStyle)
        onTouchMove: handleTouchMove.bind(this, 'bX')
        onTouchEnd: handleTouchEnd.bind(this, 'bX')
        

