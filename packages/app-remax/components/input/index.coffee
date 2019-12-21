import React, { useState, useEffect} from 'react'
import classNames from 'classnames'
import CFX  from '../../utils/cfx'
import CFS from '../../utils/cfs'
import PropTypes from 'prop-types'

# import AtComponent from '../../common/component'

import {
  View
  Input
  Label
  Text 
} from 'remax/wechat'

C = CFX {
  View
  Input
  Label
  Text 
}

export default (props) =>
  [
    className
    customStyle
    name
    cursorSpacing
    confirmType
    cursor
    selectionStart
    selectionEnd
    adjustPosition
    border
    title
    error
    clear
    placeholder
    placeholderStyle
    placeholderClass
    autoFocus
    focus
    value
    required
  ] = props

  [
    type
    maxLength
    disabled
    password
  ] = getInputProps props

  rootCls= 
    classNames(
      'at-input',
      {
        'at-input--without-border': !border,
      }, className
  containerCls=
    classNames(
      'at-input__container',
      {
        'at-input--error': error,
        'at-input--disabled': disabled
      }
    )
  overlayCls= 
    classNames(
      'at-input__overlay',
      {
        'at-input__overlay--hidden': !disabled
      }
    )
  placeholderCls= 
    classNames 'placeholder', placeholderClass
  
  C.View
    className: rootCls
    style: customStyle
  ,
    C.View
      className: containerCls
    ,
      C.View
        className: overlayCls
        onClick: onClick
      title and C.Label
        className: "at-input__title #{required} and 'at-input__title--required'}"
        for: name
      , title
    C.Input
      className: 'at-input__input'
      id: name
      name: name
      type: type
      password: password
      placeholderStyle: placeholderStyle
      placeholderClass: placeholderCls
      placeholder: placeholder
      cursorSpacing: cursorSpacing
      maxLength: maxLength
      autoFocus: autoFocus
      focus: focus
      value: value
      confirmType: confirmType
      cursor: cursor
      selectionStart: selectionStart
      selectionEnd: selectionEnd
      adjustPosition: adjustPosition
      onInput: onInput
      # // fix # 840 input 清除问题
      # // onChange: onInput
      onFocus: onFocus
      onBlur: onBlur
      onConfirm: onConfirm
    clear and value and C.View
      className: 'at-input__icon' 
      onTouchEnd: clearValue
    ,
      C.Text
        className:'at-icon at-icon-close-circle at-input__icon-close'
    error and C.View
      className: 'at-input__icon' 
      onTouchEnd: clearValue
    ,
      C.Text
        className: 'at-icon at-icon-close-circle at-input__icon-close'
    C.View
      className: 'at-input__children'
    , props.children

