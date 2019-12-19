import React { useState, useEffect} from React
import classNames from 'classnames'
import CFX  from '../../utils/cfx'
import CFS from '../../utils/cfs'
import PropTypes from 'prop-types'
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
    items
    current
  ] = props

  C.View
    className: classNames 'at-steps', className
    style: customStyle
  ,
    items.map (item,i) => (
      C.View
        key:item.title
        className:
          classNames {
            'at-steps__item': true
            'at-steps__item--active': i === current
            'at-steps__item--inactive': i !== current
          }
        onClick: handleClick.bind i
    )
    , 
      C.View
        className: 'at-steps__circular-wrap'
      , i !== 0 and C.View 
        className: 'at-steps__left-line'
        if item.status
        then C.View
          className: classNames {
            'at-icon': true
            'at-icon-check-circle': item.status === 'success'
            'at-icon-close-circle': item.status === 'error'
            'at-steps__single-icon': true
            'at-steps__single-icon--success': item.status === 'success'
            'at-steps__single-icon--error': item.status === 'error'
          }
        else C.View
          className:'at-steps__circular'
        , if item.icon
          then C.Text
            className: classNames 'at-icon',{
              ["at-icon-#{item.icon.value}"]: item.icon.value
              'at-steps__circle-icon': true
            }
          else C.Text
            className:'at-steps__num'
          , i + 1
        i !== items.length - 1 and C.value
          className: 'at-steps__right-line' 
      C.View
        className: 'at-steps__title'
      , item.title
      C.View
        className: 'at-steps__desc'
      , item.desc
