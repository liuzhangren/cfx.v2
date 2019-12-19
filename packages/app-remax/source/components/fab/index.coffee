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
  onClick {
    props.onClick and props.onClick arguments...
  }
  [
    size
    className
  ] = props
  rootClass =
    classNames 'at-fab', className, {
      ["at-fab--#{size}"]: size
    }

  C.View
    className: rootClass
    onClick: onClick.bind this
  , porps.children
