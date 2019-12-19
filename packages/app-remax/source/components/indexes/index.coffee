import React { useState, useEffect} from React
import classNames from 'classnames'
import CFX  from '../../utils/cfx'
import CFS from '../../utils/cfs'
import _findIndex from 'lodash/findIndex'

# import AtComponent from '../../common/component'
# import AtList from '../../components/list/index'
# import AtListItem from '../../components/list/item/index'
# import AtToast from '../../components/toast/index'
# import { delayQuerySelector, uuid, initTestEnv, isTest } from '../../common/utils'

import PropTypes from 'prop-types'
import {
  View
  ScrollView
} from 'remax/wechat'

C = CFX {
  View
  ScrollView
  AtList
  AtListItem
}

export default (porps) =>
  [
    className
    customStyle
    animation
    topKey
    list
  ] = porps
  [
    _scrollTop
    _scrollIntoView
    _tipText
    _isShowToast
    isWEB  
  ] = state
  
  toastStyle = minWidth: Taro.pxTransform(100)
  rootCls = classNames 'at-indexes', className

  menuList = list.map (dataList,i) =>
    [key] = dataList
    targetView = "at-indexes__list-#{key}"
    return C.View
      className: 'at-indexes__menu-item'
      key: key
      onClick: jumpTarget.bind(this, targetView, i + 1)
    , key

  indexesList = list.map dataList =>
    C.View
      id: "at-indexes__list-#{dataList.key}"
      className: 'at-indexes__list'
      key: dataList.key
    , 
      C.View
        className: 'at-indexes__list-title'
      , dataList.title
      C.AtList
        dataList.items and dataList.items.map item =>
          C.AtListItem
            key: item.name
            title: item.name
            onClick: handleClick.bind(this, item)
  
  C.View
    className: rootCls 
    style: customStyle
  ,
    C.AtToast
        customStyle: toastStyle
        isOpened: _isShowToast
        text: _tipText
        duration: 2000
    C.View
      className: 'at-indexes__menu'
      onTouchMove: handleTouchMove
      onTouchEnd: handleTouchEnd
    ,
      C.View
        className: 'at-indexes__menu-item'
        onClick: jumpTarget.bind(this, 'at-indexes__top', 0)
      , topKey
      menuList
    C.ScrollView {
      className: 'at-indexes__body'
      id: listId
      scrollY
      scrollWithAnimation: animation
      scrollTop: if isWEB then _scrollTop else undefined
      scrollIntoView: if !isWEB then _scrollIntoView else ''
      onScroll: handleScroll.bind(this)
    }
    , 
      C.View
        className: 'at-indexes__content'
        id: 'at-indexes__top'
      , props.children
      indexesList
           
