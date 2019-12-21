import React, { useState, useEffect} from 'react'
import classNames from 'classnames'
import _isFunction from 'lodash/isFunction'
import CFX  from '../../utils/cfx'
import CFS from '../../utils/cfs'
import PropTypes from 'prop-types'
import {
  View
  Textarea
} from 'remax/wechat'

C = CFX {
  View
  Textarea
}

export default (props) =>
  getMaxLength = (maxLength,textOverflowForbidden) =>
    if !textOverflowForbidden
      maxLength + 500
    maxLength
  
  # const ENV = Taro.getEnv()
  # initTestEnv()

  [
    customStyle
    className
    value
    cursorSpacing
    placeholder
    placeholderStyle
    placeholderClass
    maxLength
    count
    disabled
    autoFocus
    focus
    showConfirmBar
    selectionStart
    selectionEnd
    fixed
    textOverflowForbidden
    height
  ] = props

  _maxLength = parseInt maxLength
  actualMaxLength = getMaxLength _maxLength, textOverflowForbidden
  #   const textareaStyle = height ? `height:${Taro.pxTransform(height)}` : ''
  # const rootCls = classNames(
  #   'at-textarea',
  #   `at-textarea--${ENV}`,
  #   {
  #     'at-textarea--error': _maxLength < value.length
  #   }, className
  # )
  placeholderCls = classNames 'placeholder', placeholderClass

  C.View 
    className: rootCls
    style: customStyle
  ,
    C.Textarea
      style: textareaStyle
      placeholderStyle: placeholderStyle
      placeholderClass: placeholderCls
      cursorSpacing: cursorSpacing
      value: value
      confirmType:'完成'
      # /* 兼容之前的版本 */
      maxlength: actualMaxLength
      maxLength: actualMaxLength
      placeholder: placeholder
      disabled: disabled
      autoFocus: autoFocus
      focus: focus
      showConfirmBar: showConfirmBar
      selectionStart: selectionStart
      selectionEnd: selectionEnd
      fixed: fixed
      onInput: handleInput
      onFocus: handleFocus
      onBlur: handleBlur
      onConfirm: handleConfirm
      onLinechange: handleLinechange
      showCount: false
    ,
      count and C.View
        className: 'at-textarea__counter'
      , value.length/_maxLength



