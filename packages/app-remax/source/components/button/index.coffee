import React { useState, useEffect} from React
import classNames from 'classnames'
import CFX  from '../../utils/cfx'
import CFS from '../../utils/cfs'
import PropTypes from 'prop-types'

# import AtLoading from '../loading/index'
# import AtComponent from '../../common/component'

import {
  View
  Button
  Form
} from 'remax/wechat'

C = CFX {
  View
  Button
  Form
}

SIZE_CLASS = 
  normal: 'normal'
  small: 'small'
TYPE_CLASS =
  primary: 'primary'
  secondary: 'secondary'

export default (props) =>
  onClick = () =>
    if !props.disabled
      props.onClick and props.onClick arguments...
  
  onGetUserInfo = () =>
    props.onGetUserInfo and props.onGetUserInfo arguments...
  
  onContact = () => 
    props.onContact and props.onContact arguments...
  
  onGetPhoneNumber = () =>
    props.onGetPhoneNumber and props.onGetPhoneNumber arguments...
  
  onError = () =>
    props.onError and props.onError arguments...
  
  onOpenSetting = () =>
    props.onOpenSetting and props.onOpenSetting arguments...
  
  onSumit = () =>
    if state.isWEAPP || state.isWEB
      $scope.triggerEvent('aubmit',arguments[0].detail,{
        bubbles: true
        composed: true
      })
    
  onReset = () =>
    if state.isWAPP || state.isWEB 
      $scope.triggerEvent('reset', arguments[0].detail, {
        bubbles: true
        composed: true
      })

  [
    size = 'normal'
    type = ''
    circle
    full
    loading
    disabled
    customStyle
    formType
    openType
    lang
    sessionFrom
    sendMessageTitle
    sendMessagePath
    sendMessageImg
    showMessageCard
    appParameter
  ] = props

  [
    isWEAPP
    isALIPAY
    isWEB
  ] = state

  rootClassName = ['at-button']
  classObject = 
    ["at-button--#{SIZE_CLASS[size]}"]: SIZE_CLASS[size]
    'at-button--disabled': disabled
    ["at-button--#{type}"]: TYPE_CLASS[type]
    'at-button--circle': circle
    'at-button--full': full
  
  loadingColor = type === if 'primary' then '#fff' else ''
  loadingSize = size === if 'small' then '30' else 0
  if loading 
    component:
      C.View
        className: 'at-button__icon'
      , 
        C.AtLoading
          color: loadingColor
          size: loadingSize
    rootClassName.push 'at-button--icon'
  
  webButton =
    C.Button
      className: 'at-button__wxbutton'
    ,
      lang: lang
      type: formType === 'submit' || formType === if 'reset' then formType else 'button'
  button =
    C.Button
      className: 'at-button__wxbutton'
      formType: formType
      openType: openType
      lang: lang
      sessionFrom: sessionFrom
      sendMessageTitle: sendMessageTitle
      sendMessagePath: sendMessagePath
      sendMessageImg: sendMessageImg
      showMessageCard: showMessageCard
      appParameter: appParameter
      onGetUserInfo: onGetUserInfo.bind this
      onGetPhoneNumber: onGetPhoneNumber.bind this
      onOpenSetting: onOpenSetting.bind this
      onError: onError.bind this
      onContact: onContact.bind this
  
  C.View
    className:
      classNames rootClassName,classObject,props.className
    style: customStyle
    onClick: onClick.bind this
  ,
    isWEB and !disabled and webButton
    isWEAPP and !disabled and C.Form {
      reportSubmit
      onSumit: onSumit.bind this
      onReset: onReset.bind this
    }
    , button
    isALIPAY and !disabled and button
    component
    C.View
      className: 'at-button__text'
    , props.children