import React { useState, useEffect} from React
import classNames from 'classnames'
import CFX  from '../../utils/cfx'
import CFS from '../../utils/cfs'
import PropTypes from 'prop-types'

# import AtComponent from '../../common/component'

import {
  View
  Text
  Input
} from 'remax/wechat'

C : CFX {
  View
  Text
  Input
}

export default (props) =>
  [
    value
    placeholder
    maxLength
    fixed
    disabled
    showActionButton
    actionName
    inputType
    className
    customStyle
  ] = props

  isFocus = state

  fontSize = 14
  rootCls =classNames 'at-search-bar',
      {
        'at-search-bar--fixed': fixed
      }, className
  placeholderWrapStyle = {}
  actionStyle = {}

  if isFocus || (!isFocus and value)
  then actionStyle.opacity : 1
    actionStyle.marginRight : '0'
    placeholderWrapStyle.flexGrow : 0
  else if !isFocus and !value 
    placeholderWrapStyle.flexGrow : 1
    actionStyle.opacity : 0
    actionStyle.marginRight : "-#{((actionName.length + 1) * fontSize) + (fontSize / 2) + 10}px"
  if showActionButton 
    actionStyle.opacity : 1
    actionStyle.marginRight : '0'

  clearIconStyle = 
    display: 'flex'
  placeholderStyle = 
    visibility: 'hidden' 
  if !value.length 
  then clearIconStyle.display : 'none'
    placeholderStyle.visibility : 'visible'

  C.View
    className: rootCls
    style: customStyle
  ,
    C.View
      className: 'at-search-bar__input-cnt'
    ,
      C.View
        className: 'at-search-bar__placeholder-wrap'
        style: placeholderWrapStyle
      ,
        C.Text
          className: 'at-icon at-icon-search'
        C.Text
          className: 'at-search-bar__placeholder'
          style: placeholderStyle
        , if isFocus then '' then placeholder
      C.Input
        className: 'at-search-bar__input'
        type: inputType
        confirmType: 'search'
        value: value
        focus: isFocus
        disabled: disabled
        maxLength: maxLength
        onInput: handleChange
        onFocus: handleFocus
        onBlur: handleBlur
        onConfirm: handleConfirm
      C.View
        className: 'at-search-bar__clear'
        style: clearIconStyle
        onTouchStart: handleClear
      ,
        C.Text
          className: 'at-icon at-icon-close-circle'
    C.View
      className: 'at-search-bar__action'
      style: actionStyle
      onClick: handleActionClick
    , actionName

