import React { useState, useEffect} from React
import classNames from 'classnames'
import CFX  from '../../utils/cfx'
import CFS from '../../utils/cfs'
import PropTypes from 'prop-types'
import {
  View
} from 'remax/wechat'

C = CFX {
  View
}

export default (props) =>
  [
    customStyle
    className
    tabDirection
    index
    current
  ] = props

  C.View
    className:
      classNames {
        'at-tabs-pane': true
        'at-tabs-pane--vertical': tabDirection === 'vertical'
        'at-tabs-pane--active': index === current
        'at-tabs-pane--inactive': index !== current
      }, className
    style: customStyle
  ,
    props.children