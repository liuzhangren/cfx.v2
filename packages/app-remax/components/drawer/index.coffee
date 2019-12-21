import React, { useState, useEffect} from 'react'
import classNames from 'classnames'
import CFX  from '../../utils/cfx'
import CFS from '../../utils/cfs'
import PropTypes from 'prop-types'

# import AtList from '../list/index'
# import AtListItem from '../list/item/index'
# import AtComponent from '../../common/component'

import {
  View
} from 'remax/wechat'

C = CFX {
  View
  AtList
}

export default (props) =>
  [
    mask
    width
    right
    items
  ] = props

  [
    animShow
    _show
  ] = state
  rootClassName = ['at-drawer']

  maskStyle =
    display: if mask then 'block' else 'none'
    opacity: if animShow then 1 else 0
  
  listStyle = 
    width
    transition: if animShow then  'all 225ms cubic-bezier(0, 0, 0.2, 1)' then 'all 195ms cubic-bezier(0.4, 0, 0.6, 1)'

  classObject =
    'at-drawer--show': animShow
    'at-drawer--right': right
    'at-drawer--left': !right
  
  _show and C.View
    className: classNames(rootClassName, classObject, props.className)
  ,
    C.View
      className: 'at-drawer__mask'
      style: maskStyle
      onClick: onMaskClick.bind this
    C.View
      className: 'at-drawer__content' 
      style: listStyle
    ，
      if item.length
      then  
        C.AtList
          item.map (name,index) =>
            C.AtListItem
              key: "#{name}-#{index}"
              data-index: index
              onClick: onItemClick.bind this, index
              title: name
              arrow: 'right'
      else props.children

