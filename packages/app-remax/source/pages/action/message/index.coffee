import React,{
  useState
  useEffect
} from 'react'

import {
  View
}  from 'remax/wechat'

import CFX from '../../../utils/cfx'
import CFS from '../../../utils/cfs'

import clsx from 'clsx'
import styl from 'cfx.styl'
import style from './index.cfs'
import './index.cfs.css'

import AtButton from '../../../components/button'
import AtMessage from '../../../components/message'
import DocsHeader from '../../components/doc-header'


C = CFX {
  AtButton
  View
  AtMessage
  DocsHeader
}

S = CFS {
  style
  styl
}

export default () =>
  config =
    navigationBarTitleText: 'Taro UI'
  
  handleClick = (type) =>
    AtMessage {
      'message': '消息通知'
      'type': type
    }
  
  C.View
    className:'page toast-page'
  ,
    C.DocsHeader
      title: 'Message 消息通知'
    C.View
      className: 'doc-body'
    ,
      C.View
        className: 'panel__title'
      , '基本案例'
      C.View
        className: 'panel__content'
      ,
        C.View
          className: 'example-item'
        ,
          C.AtButton
            onClick: handleClick.bind ''
          , '普通消息'
        C.View
          className: 'example-item'
        ,
          C.AtButton
            onClick: handleClick.bind 'success'
          , '成功消息'
        C.View
          className: 'example-item'
        ,
          C.AtButton
            onClick: handleClick.bind 'success'
          , '错误消息'
        C.View
          className: 'example-item'
        ,
          C.AtButton
            onClick: handleClick.bind 'success'
          , '警告消息'
        C.View
          className: 'example-item'
        ,
          C.AtButton
            onClick: handleClick.bind 'success'
          , '提示消息'