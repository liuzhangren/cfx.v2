import React, {
  useState
  useEffect
} from 'react'
import CFX from '../../utils/cfx'
import CFS from '../../utils/cfs'
import clsx from 'clsx'
import styl from 'cfx.styl'
import style from './index.cfs'
import classNames from 'classnames'
import './index.cfs.css'

import AtComponent from '../../common/component'

import {
  View
} from 'remax/wechat'

S = CFS {
  style
  styl
}

C = CFX {
  View
}

export default (props) =>
  [state, setState] = useState({
    _isOpened: false
    _message: ''
    _type: 'info'
    _duration: 3000
  })
  _timer = null
  bindMessageListener = () =>
    {
      message
      type
      duration
    } = options
    {
      isOpened: true
      _message: message
      _type: type
      _duration: duration || state._duration
    } = newState
    setState newState, ()=>
      clearTimeout _timer
      _timer = setTimeout = () =>
        setState {
          _isOpened: false
        }
      , state._duration
  useEffect = () =>
    bindMessageListener()
    return 
  {
    className
    customStyle
  } = props

  {
    _message
    _isOpened
    _type
  } = state 

  rootCls = 
    classNames {
      'at-message': true
      'at-message--show': _isOpened
      'at-message--hidden': !_isOpened
    }, "at-message--#{_type}", className
  
  C.View 
    className: rootCls
    style: customStyle
  , _message