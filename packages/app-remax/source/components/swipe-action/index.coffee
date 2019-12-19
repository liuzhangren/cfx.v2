import React { useState, useEffect} from React
import classNames from 'classnames'
import CFX  from '../../utils/cfx'
import CFS from '../../utils/cfs'
import _isNil from 'lodash/isNil'
import _isEmpty from 'lodash/isEmpty'
import _inRange from 'lodash/inRange'
import _isFunction from 'lodash/isFunction'

# import AtComponent from '../../common/component'
# import AtSwipeActionOptions from './options/index'

# import {
#   delayGetClientRect,
#   delayGetScrollOffset,
#   uuid,
#   isTest
# } from '../../common/utils'

import PropTypes from 'prop-types'
import {
  View
  Text
} from 'remax/wechat'

C = CFX {
  View
  Text
}

export default (props) =>
  constructor props
    # super(...arguments)
    [ isOpened ] = props

    endValue = 0
    startX = null
    startY = null
    maxOffsetSize = 0

    domInfo = {}
    isMoving = null
    isTouching = false

    [
      componentId: if isTest() then 'tabs-AOTU2018' else uuid()
      offsetSize: 0 
      _isOpened: is0pened
    ]

    getDomInfo {
      domInfo = {}
      return Promise.all [
        delayGetClientRect {
          self:this
          delayTime:0
          selectorStr: "#swipeAction-#{state.componentId}"
        },
        delayGetScrollOffset { delayTime:0 }
      ]
      .then ([rect,scrollOffset]) =>
        rect[0].top += scrollOffset[0].scrollTop
        rect[0].bottom += scrollOffset[0].scrollTop
        domInfo = rect[0]
    }

    