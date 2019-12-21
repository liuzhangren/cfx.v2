import React, { useState, useEffect} from 'react'
import classNames from 'classnames'
import CFX  from '../../utils/cfx'
import CFS from '../../utils/cfs'
import PropTypes from 'prop-types'
import _isFunction from 'lodash/isFunction'

# import AtComponent from '../../common/component'
# import { handleTouchScroll } from '../../common/utils'

import {
  View
  Text
  ScrollView
} from 'remax/wechat'

C = CFX {
  View
  Text
  ScrollView
}

export default (props) =>
  [ _isOpened ] = state 
  [
    title
    scrollY
    scrollX
    scrollTop
    scrollLeft
    upperThreshold
    lowerThreshold
    scrollWithAnimation
  ] = props

  rootClass = classNames(
    'at-float-layout',
    {
      'at-float-layout--active': _isOpened
    },
    props.className
  )

  C.View
    className: rootClass
    onTouchMove: handleTouchMove
  ,
    C.View
      onClick: close
      className: 'at-float-layout__overlay'
    C.View
      className: 'at-float-layout__container layout'
    ,
      if title
      then  
        C.View
          className: 'layout-header'
        ,
          C.Text
            className: 'layout-header__title'
          , title
          C.View
            className: 'layout-header__btn-close'
            onClick: close
      else null
      C.View
        className: 'layout-body'
      ,
        C.ScrollView
          scrollY: scrollY
          scrollX: scrollX
          scrollTop: scrollTop
          scrollLeft: scrollLeft
          upperThreshold: upperThreshold
          lowerThreshold: lowerThreshold
          scrollWithAnimation: scrollWithAnimation
          onScroll: props.onScroll
          onScrollToLower: props.onScrollToLower
          onScrollToUpper: props.onScrollToUpper
          className: 'layout-body__content'
        , props.children
