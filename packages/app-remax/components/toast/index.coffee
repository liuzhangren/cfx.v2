import React, { useState, useEffect} from 'react'
import classNames from 'classnames'
import _isFunction from 'lodash/isFunction'
import CFX  from '../../utils/cfx'
import CFS from '../../utils/cfs'
import statusImg from './img.json'
import {
  View
  Text
  Image
} from 'remax/wechat'

C = CFX {
  View
  Image
  Text
}

export default (props) =>
  {
    isOpened
    duration
  } = props

  _timer = null
  [_isOpened,setOpened] = useState isOpened

  clearTimmer = () =>
    console.log 'clearTimmer'

  makeTimer = (duration) =>
    console.log duration

  close = () => 
    if _isOpened 
      setOpened false
      handleClose()
    clearTimmer()

  handleClose = () =>
    console.log 'handleClose'
  
  useEffect () =>
    if !props.isOpened
      close()
      return
    if !_isOpened
      setOpened true
    else 
      clearTimmer()
    makeTimer props.duration
  , [props.isOpened, props.duration]

  handleClick = () =>
    console.log 'handleClick'
  {
    customStyle
    text
    icon
    status
    image
    hasMask
  } = props
  realImg = image || statusImg[status] || null
  isRenderIcon = !!(icon and !(image || statusImg[status]))
  bodyClass = classNames 'toast-body',{
    'at-toast__body--custom-image': image,
    'toast-body--text': !realImg and !icon,
    ["at-toast__body--#{status}"]: !!status  
  }
  iconClass = classNames 'at-icon',{
    ["at-icon-#{icon}"]:icon
  }

  if _isOpened
  then
    C.View {
      className:
        classNames 'at-toast', this.props.className
    }
    ,
      hasMask and C.View
        className: 'at-toast__overlay'
      C.View
        className: bodyClass
        style: customStyle
        onClick: handleClick
      ,
        C.View
          className: 'toast-body-content'
        ,
          if realImg
          then
            C.View
              className: 'toast-body-content__img'
            ,
              C.Image
                className: 'toast-body-content__img-item'
                src: realImg
                mode: 'scaleToFill'
          else null
          isRenderIcon and C.View
            className: 'toast-body-content__icon'
            ,
              C.Text
                className: iconClass
          text and C.View
            className: 'toast-body-content__info'
            ,
              C.Text {
                text
              }
  else null
  

