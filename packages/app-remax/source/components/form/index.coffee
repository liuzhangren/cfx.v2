import React { useState, useEffect} from React
import classNames from 'classnames'
import CFX  from '../../utils/cfx'
import CFS from '../../utils/cfs'
import PropTypes from 'prop-types'

# import AtComponent from '../../common/component'

import {
  Form
} from 'remax/wechat'

C = CFX {
  Form
}

export default (props) =>
  [
    customStyle
    className
    reportSubmit
  ] = props
  rootCls = classNames 'at-form',className

  C.Form
    className: rootCls
    style: customStyle
    onSubmit: onSubmit.bind this
    reportSubmit: reportSubmit
    onReset: onReset.bind this
  , props.children
  