import React { useState, useEffect} from React
import classNames from 'classnames'
import CFX  from '../../utils/cfx'
import CFS from '../../utils/cfs'
import PropTypes from 'prop-types'
import isObject from 'lodash/isObject'

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
  [
    customStyle
    className
    color
    fixed
    border
    leftIconType
    leftText
    title
    rightFirstIconType
    rightSecondIconType
  ] = props

  linkStyle = color

  defaultIconInfo = 
    customStyle: ''
    className: ''
    prefixClass: 'at-icon'
    value: ''
    color: ''
    size: 24

  leftIconInfo = 
    if isObject leftIconType
    then { defaultIconInfo..., leftIconType... }
    else { defaultIconInfo..., value: leftIconType }

  leftIconClass = 
    classNames leftIconInfo.prefixClass,{
      ["#{leftIconInfo.prefixClass}-#{leftIconInfo.value}"]: leftIconInfo.value
    },leftIconInfo.className

  rightFirstIconInfo = 
    if isObject rightFirstIconType
    then { defaultIconInfo..., rightFirstIconType... }
    else { defaultIconInfo..., value: rightFirstIconType }

  rightFirstIconClass = 
    classNames rightFirstIconInfo.prefixClass, {
      ["#{rightFirstIconInfo.prefixClass}-#{rightFirstIconInfo.value}"]: rightFirstIconInfo.value
    }, rightFirstIconInfo.className

  rightSecondIconInfo = 
    if isObject rightSecondIconType
    then { defaultIconInfo..., rightSecondIconType... }
    else { defaultIconInfo..., value: rightSecondIconType }

  rightSecondIconClass = 
    classNames rightSecondIconInfo.prefixClass, {
      ["#{rightSecondIconInfo.prefixClass}-#{rightSecondIconInfo.value}"]: rightSecondIconInfo.value
    }, rightSecondIconInfo.className 
  
  C.View
    className:
      classNames {
        'at-nav-bar': true
        'at-nav-bar--fixed': fixed
        'at-nav-bar--no-border': !border
      }, className
    style: customStyle
    C.View
      className: 'at-nav-bar__left-view'
      onClick: handleClickLeftView.bind this
      style: linkStyle
    ,
      leftIconType and C.Text
        className: leftIconClass
        style: 
          mergeStyle {
            color: leftIconInfo.color,
            fontSize: "#{Taro.pxTransform(parseInt(leftIconInfo.size) * 2)}"
          }
          leftIconInfo.customStyle
      C.Text
        className: 'at-nav-bar__text'
      , leftText
    C.View
      className: 'at-nav-bar__title'
    ,
      title || props.children
    C.View
      className: 'at-nav-bar__right-view'
    ,
      C.View
        className=
          classNames {
            'at-nav-bar__container': true
            'at-nav-bar__container--hide': !rightSecondIconType
          }
        style: linkStyle
        onClick: handleClickNd.bind this
      ,
        rightSecondIconType and C.Text
          className: rightSecondIconClass
          style: 
            mergeStyle {
              color: rightSecondIconInfo.color
              fontSize: "#{Taro.pxTransform(parseInt(rightSecondIconInfo.size) * 2)}"
            }, rightSecondIconInfo.customStyle
      C.View
        className:
          classNames {
            'at-nav-bar__container': true
            'at-nav-bar__container--hide': !rightFirstIconType
          }
        style: linkStyle
        onClick: handleClickSt.bind this
      ,
        rightFirstIconType and C.Text
          className: rightFirstIconClass
          style: 
            mergeStyle {
              color: rightFirstIconInfo.color
              fontSize: "#{Taro.pxTransform(parseInt(rightFirstIconInfo.size) * 2)}"
            }, rightFirstIconInfo.customStyle


