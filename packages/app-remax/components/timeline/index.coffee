import React, { useState, useEffect} from 'react'
import classNames from 'classnames'
import _isFunction from 'lodash/isFunction'
import CFX  from '../../utils/cfx'
import CFS from '../../utils/cfs'
import {
  View
  Text
} from 'remax/wechat'

C = CFX {
  View
  Text
}

export default (props) =>
  [
    pending
    items
    customStyle
  ] = props
  
  rootClassName = ['at-timeline']

  if pending
    rootClassName.push 'at-timeline-pending'
  
  rootClassObject = {
    'at-timeline--pending': pending
  }

  itemElems = item.map (item,index) =>  
    {
      title = ''
      color
      icon
      content = []
    } = item

    iconClass = classNames {
      'at-icon': true
      ["at-icon-#{icon}"]: icon
    }

    itemRootClassName = ['at-timeline-item']
    if color 
      itemRootClassName.push "at-timeline-item--#{color}"

    dotClass = []
    if icon 
      dotClass.push 'at-timeline-item__icon'
    else
      dotClass.push 'at-timeline-item__dot'
  
  C.View 
    className: classNames itemRootClassName
    key: "at-timeline-item-#{index}"
  ,
    C.View
      className: 'at-timeline-item__tail'
    C.View
      className: classNames dotClass
    ,
      icon and C.Text
        className: iconClass
    C.View
      className: 'at-timeline-item__content'
    ,
      C.View
        className:'at-timeline-item__content-item'
      , title
      content.map (sub,subIndex) => (
        C.View
          className: 'at-timeline-item__content-item at-timeline-item__content--sub'
          key: subIndex
        , sub
      )
  C.View
    className: classNames rootClassName, rootClassObject, props.className
    style: customStyle
  , itemElems

