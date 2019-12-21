import React, { useState, useEffect} from 'react'
import classNames from 'classnames'
import CFX  from '../../utils/cfx'
import CFS from '../../utils/cfs'
import PropTypes from 'prop-types'
import _isUndefined from 'lodash/isUndefined'

# import AtComponent from '../../common/component'

import {
  View
  Switch
} from 'remax/wechat'

C = CFX {
  View
  Switch
}

export default (props) =>
  # handleChange = (event, ...arg) => {
  #   const { value, checked } = event.detail
  #   const state = _isUndefined(value) ? checked : value
  #   this.props.onChange(state, event, ...arg)
  # }
  [
    customStyle
    className
    disabled
    border
    title
    checked
    color
  ] = props

  rootCls = classNames 'at-switch',{
    'at-switch--without-border': !border
  },className

  containerCls = classNames 'at-switch__container',{
    'at-switch--disabled': disabled
  }

  C.View 
    className: rootCls
    style: customStyle
  ,
    C.View
      className:'at-switch__title'
    , title
    C.View
      className: containerCls
      ,
      C.View
        className: 'at-switch__mask'
      C.Switch
        className: 'at-switch__switch'
        checked: checked
        color: color
        onChange: handleChange

