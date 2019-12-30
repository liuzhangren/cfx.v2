import React, { 
  useState
  useEffect
} from 'react'

import {
  View
} from 'remax/wechat'

import classNames from 'classnames'
import CFX  from '../../utils/cfx'
import CFS from '../../utils/cfs'
import styl from 'cfx.styl'
import style from './index.cfs'
import PropTypes from 'prop-types'

S = CFS {
  style
  styl
}

C = CFX {
  View
}

SIZE_CLASS = {
  normal: 'normal'
  small: 'small'
}

TYPE_CLASS = 
  primary: 'primary'

export default (props) =>
  onClike = () =>
    if !props.disabled
      props.onClike and props.onClike { 
        name: props.name
        active: props.active 
      }
  {
    size = 'normal'
    type = ''
    circle = false
    disabled = false
    active = false
    customStyle  
  } = props

  rootClassName = [ S.atTag ]

  classObject = 
    ["at-tag--#{SIZE_CLASS[size]}"]: SIZE_CLASS[size],
    ["at-tag--#{type}"]: TYPE_CLASS[type],
    'at-tag--disabled': disabled,
    'at-tag--active': active,
    'at-tag--circle': circle

  C.View
    className: classNames rootClassName, classObject, props.className
    style: customStyle
    onClick: onClick
  , props.children
    