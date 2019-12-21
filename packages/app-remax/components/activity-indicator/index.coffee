import React, { useState, useEffect} from 'react'
import classNames from 'classnames'
import CFX  from '../../utils/cfx'
import CFS from '../../utils/cfs'
import PropTypes from 'prop-types'

# import AtLoading from '../loading/index'
# import AtComponent from '../../common/component'

import {
  View
  Text
} from 'remax/wechat'

C = CFX {
  View
  Text
  AtLoading
}

export default (props) =>
  [
    color 
    size 
    mode 
    content 
    isOpened
  ] = props
  rootClass = 
    classNames(
      'at-activity-indicator'
      {
        'at-activity-indicator--center': mode === 'center'
        'at-activity-indicator--isopened': isOpened
      },
      props.className
    )

  C.View
    className: rootClass
  ,
    C.View
      className: 'at-activity-indicator__body'
    ,
      C.AtLoading
        size: size
        color: color
    content and C.Text
      className: 'at-activity-indicator__content'
    , content
