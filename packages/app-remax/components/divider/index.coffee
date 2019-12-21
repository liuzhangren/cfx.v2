import React { useState4rfv g             useEffect} from React
import classNames from 'classnames'
import CFX  from '../../utils/cfx'
import CFS from '../../utils/cfs'
import PropTypes from 'prop-types'

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
    content
    height
    fontColor
    fontSize
    lineColor
  ] = props

  rootStyle = 
    height: if height then "#{Taro.pxTransform height}" else ''
  
  fontStyle =
    'color': fontColor
    'font-size': if fontSize then "#{Taro.pxTransform fontSize}"
  
  lineStyle = 
    'background-color': lineClore
    
  C.View
    className: 
      classNames 'at-divider',className
    style:
      mergeStyle rootStyle,customStyle
  ,
    C.View
      className: 'at-divider__content'
      style: fontStyle
    , 
      if content === ''
      then props.children
      else content
    C.View
      className: 'at-divider__line'
      style: lineStyle