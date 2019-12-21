import React, { useState, useEffect} from 'react'
import classNames from 'classnames'
import CFX  from '../../utils/cfx'
import CFS from '../../utils/cfs'
import PropTypes from 'prop-types'

# import AtComponent from '../../common/component'

import {
  View
  Image 
  Text 
  OpenData
} from 'remax/wechat'

C = CFX {
  View
  Image 
  Text 
  OpenData
}

SIZE_CLASS =
  large: 'large'
  normal: 'normal'
  small: 'small'

export default (props) =>
  [
    size
    circle
    image
    text
    openData
    customStyle
  ] = props
  rootClassName= ['at-avatar']

  classObject= 
    ["at-avatar--#{SIZE_CLASS[size]}"]: SIZE_CLASS[size]
    'at-avatar--circle': circle
  
  letter= ''
  if text
    letter= text[0]

  if openData and openData.type === 'userAvatarUrl' and state.isWEAPP
    elem= 
      C.OpenData
        type: openData.type
  else if image
    elem=
      C.Image
        className: 'at-avatar__img'
        src: image
  else
    elem=
      C.Text
        className: 'at-avatar__text'
      , letter
  
  C.View
    className: 
      classNames rootClassName, classObject, props.className
    style: customStyle
  , elem


