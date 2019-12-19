import React { useState, useEffect} from React
import classNames from 'classnames'
import CFX  from '../../utils/cfx'
import CFS from '../../utils/cfs'
import PropTypes from 'prop-types'
import _isFunction from 'lodash/isFunction'
import AtActionSheetBody from './body/index'
import AtActionSheetHeader from './header/index'
import AtActionSheetFooter from './footer/index'

# import AtComponent from '../../common/component'

import {
  View
} from 'remax/wechat'

C = CFX {
  View
  AtActionSheetHeader
  AtActionSheetBody
  AtActionSheetFooter
}

export default (props) =>
  handleClose = () => 
    if _isFunction props.onClose
      props.onClose()

  handleCancel = () => 
    if _isFunction props.onCancel
      props.onCancel()
    close()

  close = () => 
    setState(
      {     
        _isOpened: false
      }
      handleClose
    )
  }

  handleTouchMove = e => 
    e.stopPropagation()
    e.preventDefault()
  
  [
    title 
    cancelText
    className
  ] = props

  [ 
    _isOpened 
  ] = state

  rootClass=
    classNames(
      'at-action-sheet',
      {
        'at-action-sheet--active': _isOpened
      },
      className
    )
  
  C.View
    className: rootClass
    onTouchMove: handleTouchMove
  ,
    C.View
      onClick: close
      className: 'at-action-sheet__overlay'
    C.View
      className: 'at-action-sheet__container'
    , title  and C.AtActionSheetHeader{}
    ,title
    C.AtActionSheetBody{}
    , props.children
    , 
      C.AtActionSheetFooter
        onClick: handleCancel
      , cancelText