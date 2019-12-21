import React, { useState, useEffect} from 'react'
import classNames from 'classnames'
import CFX  from '../../utils/cfx'
import CFS from '../../utils/cfs'
import PropTypes from 'prop-types'

# import { initTestEnv, pxTransform } from '../../common/utils'
# import AtComponent from '../../common/component'

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
    disabled
    values
    selectedColor
    current
    color
    fontSize
  ] = props

  rootStyle = {
    borderColor: selectedColor
  }

  itemStyle = {
    color: selectedColor
    fontSize: pxTransform fontSize
    borderColor: selectedColor
    backgroundColor: color
  }

  selectedItemStyle = {
    color
    fontSize: pxTransform fontSize
    borderColor: selectedColor
    backgroundColor: selectedColor
  }

  rootCls = classNames 'at-segmented-control', {
    'at-segmented-control--disabled': disabled
  }, className

  C.View
    className: rootCls
    style: mergeStyle rootStyle, customStyle
  ,
    values.map (value,i) => (
      C.View
        className: classNames 'at-segmented-control__item', {
                'at-segmented-control__item--active': current === i
        }
        style: if current === i then selectedItemStyle else itemStyle
        key : value
        onClick : handleClick.bind i
      , value
    )