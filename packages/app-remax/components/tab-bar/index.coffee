import React, { useState, useEffect} from 'react'
import classNames from 'classnames'
import CFX  from '../../utils/cfx'
import CFS from '../../utils/cfs'
import PropTypes from 'prop-types'
# import AtBadge from '../../components/badge/index'
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
  AtBadge
}

export default (props) =>
  # handleClick () {
  #   props.onClick(...arguments)
  # }
  [
    customStyle
    className
    fixed
    backgroundColor
    tabList
    current
    color
    iconSize
    fontSize
    selectedColor
  ] = props

  defaultStyle = 
    color: color || ''
  selectedStyle = 
    color: selectedColor || ''
  titleStyle = 
    fontSize: if fontSize then "#{fontSize}px" else ''
  rootStyle = 
    backgroundColor: backgroundColor || ''
  imgStyle =
    width: "#{iconSize}px"
    height: "#{iconSize}px"

  C.View
    className = classNames {
      'at-tab-bar': true
      'at-tab-bar--fixed': fixed
    }, className
    style = mergeStyle rootStyle,customStyle
  ,
    tabList.map (item, i) => (
      C.View
        className: classNames 'at-tab-bar__item',{ 'at-tab-bar__item--active': current === i }
        style : if current === i then selectedStyle else defaultStyle 
        key : item.title
        onClick: handleClick.bind item
      ,
        if item.iconType then
          C.AtBadge
            dot: !!item.dot
            value: item.Text
            maxValue: Number item.max
          , 
            C.Image
              className: classNames 'at-tab-bar__inner-img',{
                'at-tab-bar__inner-img--inactive': current !== i
              }
              mode: 'widthFix'
              src: item.selecteImage || item.image
              style: imgStyle
            C.Image
              className: classNames 'at-tab-bar__inner-img',{
                'at-tab-bar__inner-img--inactive': current === i
              }
              mode: 'widthFix'
              src: item.image
              style: imgStyle
        else null
      
      C.View
      ,
        C.AtBadge
          dot: if (item.iconType || item.image) then false else !!item.dot
          value: if (item.iconType || item.image) then null else !!item.text
          maxValue: if (item.iconType || item.image) then null else Number item.max
        ,
          C.View
            className: 'at-tab-bar__title'
            style: titleStyle
          , item.title
