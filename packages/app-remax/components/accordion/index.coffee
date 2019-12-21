import React, { useState, useEffect } from 'react'
import {
  View
  Text
} from 'remax/wechat'
import classNames from 'classnames'
import CFX  from '../../utils/cfx'
import CFS from '../../utils/cfs'

C = CFX {
  View
  Text
}

export default (props) =>
  [ 
    wrapperHeight
    setWrapperHeight
  ] = useState ''

  isCompleted = true
  startOpen = false


  handleClick = (event) =>
    { open } = props
    if !isCompleted
      return
    props.onClick !open, event
  
  toggleWithAnimation = () => 
    {
      open
      isAnimation
    } = props

    if !isCompleted or isAnimation
      return

    isCompleted = false 
  
  useEffect () =>
    unless open is props.open
      startOpen = open and isAnimation
      toggleWithAnimation()
  , [ props.open, props.isAnimation ]

  {
    customStyle
    className
    title
    icon
    hasBorder
    open
    note
  } = props

  rootCls = classNames 'at-accordion', className
  prefixClass = (icon and prefixClass) or "at-icon"
  iconCls = classNames
    [prefixClass]: true
    ["#{prefixClass}-#{icon and icon.value}"]: icon and icon.value
    "at-accordion__icon": true
  
  headerCls = classNames "at-accordion__header"
  ,
    'at-accordion__header--noborder': !hasBorder
  
  arrowCls = classNames 'at-accordion__arrow'
  ,
    'at-accordion__arrow--folded': !!open
  
  contentCls = classNames 'at-accordion__content'
  ,
    'at-accordion__content--inactive': (!open and isCompleted) or startOpen
  iconStyle = 
    color: (icon and icon.color) or ''
    fontSize: (icon and "#{icon.size}px") or ''

  contentStyle = { height: "#{wrapperHeight}px" }

  if isCompleted
    contentStyle.height = ''
  
  C.View
    className: rootCls
    style: customStyle
  ,
    C.View
      className: headerCls
      onClick: handleClick
    ,
      icon and icon.value and C.Text
        className: iconCls
      
      C.View
        className: 'at-accordion__info'
      ,
        C.View
          className: 'at-accordion__info__title'
        , title

        C.View
          className: 'at-accordion__info__note'
        , note
      
      C.View
        className: arrowCls
      ,
        C.Text
          className: 'at-icon at-icon-chevron-down'

    C.View
      style: contentStyle
      className: contentCls
    ,
      C.View
        className: 'at-accordion__body'
      , props.children

    