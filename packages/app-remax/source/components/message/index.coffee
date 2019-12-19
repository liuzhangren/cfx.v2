import React { useState, useEffect} from React
import classNames from 'classnames'
import CFX  from '../../utils/cfx'
import CFS from '../../utils/cfs'
import PropTypes from 'prop-types'

# import AtComponent from '../../common/component'

import {
  View
} from 'remax/wechat'

C = CFX {
  View
}

export default (props) =>
  [
    className
    customStyle
  ] = props

  [
    _message
    _isOpened
    _type
  ] = state 

  rootCls = 
    classNames {
      'at-message': true
      'at-message--show': _isOpened
      'at-message--hidden': !_isOpened
    }, "at-message--#{_type}", className
  
  C.View 
    className: rootCls
    style: customStyle
  , _message