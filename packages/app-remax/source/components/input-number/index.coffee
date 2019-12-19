import React { useState, useEffect} from React
import classNames from 'classnames'
import CFX  from '../../utils/cfx'
import CFS from '../../utils/cfs'
import PropTypes from 'prop-types'
import _toString from 'lodash/toString'

import {
  View
  Input
  Text
} from 'remax/wechat'

C = CFX {
  View
  Input
  Text
}

export default (props) =>
  [
    customStyle
    className
    width
    disabled
    value
    type
    min
    max
    size
    disabledInput
  ] = props

  inputStyle= if width:width then "#{pxTransform width}" then ''
  inputValue= handleValue value
  rootCls= 
    classNames 'at-input-number', {
      'at-input-number--lg': size
    }, className
  minusBtnCls= 
    classNames 'at-input-number__btn', {
      'at-input-number--disabled': inputValue <= min || disabled
    }
  plusBtnCls= 
    classNames 'at-input-number__btn', {
      'at-input-number--disabled': inputValue >= max || disabled
    }
  
  C.View
    className: rootCls  
    style: customStyle
  ,
    C.View
      className: minusBtnCls 
      onClick: handleClick.bind(this, 'minus')
    ,
      C.Text
        className: 'at-icon at-icon-subtract at-input-number__btn-subtract'
    C.Input
      className: 'at-input-number__input'
      style: inputStyle
      type: type
      value: inputValue
      disabled: disabledInput || disabled
      onInput: handleInput
      onBlur: handleBlur
    C.View
      className: plusBtnCls
      onClick: handleClick.bind(this, 'plus')
    ,
      C.Text
        className: 'at-icon at-icon-add at-input-number__btn-add'

