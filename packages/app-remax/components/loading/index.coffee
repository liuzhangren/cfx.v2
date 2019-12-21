import React, { useState, useEffect} from 'react'
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
    color
    size
  ] = props

  sizeStyle=
    'border': if color then "1px solid #{color}" else ''
    'border-color': if color then "#{color} transparent transparent transparent" else ''

  ringStyle = Object.assign {}, colorStyle, sizeStyle

  C.View
    className: 'at-loading'
    style: sizeStyle
  ,
    C.View
      className: 'at-loading__ring' 
      style: ringStyle
    C.View  
      className: 'at-loading__ring' 
      style: ringStyle
    C.View  
      className: 'at-loading__ring' 
      style: ringStyle
