import React { useState, useEffect} from React
import classNames from 'classnames'
import CFX  from '../../utils/cfx'
import CFS from '../../utils/cfs'
import PropTypes from 'prop-types'

# import AtComponent from '../../common/component'

import {
  Text
} from 'remax/wechat'

C = CFX {
  Text
}

export default (props) =>
  [
    customStyle
    className
    prefixClass
    value
    size
    color  
  ] = props

  rootStyle = {
    fontSize: "#{Taro.pxTransform parseInt(size) * 2)}"
    color
  }
  iconName = if value then "#{prefixClass}-#{value}" else ''

  C.Text
    className:
      classNames(
        prefixClass
        iconName
        className
      )
    style: mergeStyle(rootStyle, customStyle)
    onClick: handleClick.bind(this)
