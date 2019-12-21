import React, { useState, useEffect} from 'react'
import classNames from 'classnames'
import CFX  from '../../utils/cfx'
import CFS from '../../utils/cfs'
import PropTypes from 'prop-types'
import _isFunction from 'lodash/isFunction'

# import AtComponent from '../../../common/component'

import {
  View
} from 'remax/wechat'

C = CFX {
  View
}

export default (props) =>
  handleClick = (args...) => 
    if _isFunction props.onClick
      props.onClick args...
  
  rootClass=
    classNames(
      'at-action-sheet__footer',
      this.props.className
    )

  C.View
    onClick: handleClick
    className: rootClass
  , props.children
    