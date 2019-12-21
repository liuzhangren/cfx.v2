import React, { useState, useEffect} from 'react'
import classNames from 'classnames'
import CFX  from '../../utils/cfx'
import CFS from '../../utils/cfs'
import PropTypes from 'prop-types'
import _isFunction from 'lodash/isFunction'

# import AtComponent from '../../common/component'

import {
  View
  Text
  Image
} from 'remax/wechat'

C = CFX {
  View
  Text
  Image
}

export default (props) =>
  handleClick = (args...) => {
    if _isFunction props.onClick
      props.onClick args...

  [
    title 
    note 
    extra 
    extraStyle 
    thumb 
    isFull 
    icon
  ] = props

  rootClass :
    classNames 'at-card',{
      'at-card--full': isFull
    },
    props.className

  iconClass = classNames {
    'at-icon': true
    ["at-icon-#{icon and icon.value}"]: icon and icon.value
    'at-card__header-icon': true
  }
  iconStyle = 
    color : ( icon and icon.color ) || ''
    fontSize: icon and "#{icon.size}px" || ''

  C.View
    onClick: handleClick
    className: rootClass
  ,
    C.View
      className:'at-card__header'
    ,
      thumb and C.View
        className: 'at-card__header-thumb'
      ,
        C.Image
          className: 'at-card__header-thumb'
          mode: 'scaleToFill'
          src: thumb
      props.renderIcon
      !thumb and icon and icon.value and C.Text
        className: iconClass
        style: iconStyle
      C.Text
        className: 'at-card__header-title'
      , title
      extra and C.Text
        style:
          extraStyle...
        className: 'at-card__header-extra'
      , extra
    C.View
      className: 'at-card__content'
    ,
      C.View
        className: 'at-card__content-info'
      , props.children
      note and C.View
        className: 'at-card__content-note'
      , note