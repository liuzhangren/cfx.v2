import React, { useState, useEffect} from 'react'
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
  rootClass =
    classNames 'at-list',{
      'at-list--no-border': !this.props.hasBorder
    }, props.className

  C.View
    className: rootClass
  , props.children
  
