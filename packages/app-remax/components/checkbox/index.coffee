import React, { useState, useEffect} from 'react'
import classNames from 'classnames'
import CFX  from '../../utils/cfx'
import CFS from '../../utils/cfs'
import PropTypes from 'prop-types'

# import AtComponent from '../../common/component'

import {
  View
  Text
} from 'remax/wechat'

C = CFX {
  View
  Text
}

export default (props) =>
  handleClick = (idx) =>
    [
      selectedList
      options
    ] = props
    option = options[idx]
    [
      disabled
      value
    ] = option
    if disabled return
    selectedSet = new Set selectedList
    if !selectedSet.has value
      selectedSet.add value
    else
      selectedSet.delete value
    props.onChange [selectedSet...]
  
  [
    customStyle
    className
    options
    selectedList
  ] = props
  rootCls = classNames 'at-checkbox',className

  C.View
    className: rootCls
    style: customStyle
  ,
    options.map (option, idx) =>
      {
        value
        disabled
        label 
        desc
      } = option
      optionCls = classNames 'at-checkbox__option',{
        'at-checkbox__option--disabled': disabled,
        'at-checkbox__option--selected': selectedList.includes(value)
      }

      C.View
        className:optionCls
        key: value
        onClick: handleClick.bind this, idx
      ,
        C.View
          className: 'at-checkbox__option-wrap'
        ,
          C.View
            className: 'at-checkbox__option-cnt'
          ,
            C.View
              className: 'at-checkbox__icon-cnt'
            ,
              C.Text
                className: 'at-icon at-icon-check'
            C.View
              className: 'at-checkbox__title'
            , label
          desc and C.View
            className: 'at-checkbox__desc'
          , desc
          