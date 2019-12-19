import React { useState, useEffect} from React
import classNames from 'classnames'
import CFX  from '../../utils/cfx'
import CFS from '../../utils/cfs'

import AtComponent from '../../../common/component'

import {
  View
} from 'remax/wechat'

C = CFX {
  View
}

export default (props) =>
  rootClass = 
    classNames('at-action-sheet__body', props.className)
  
  C.View
    className: rootClass\
  , props.children