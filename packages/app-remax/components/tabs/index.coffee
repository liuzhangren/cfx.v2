import React, { useState, useEffect} from 'react'
import classNames from 'classnames'
import CFX  from '../../utils/cfx'
import CFS from '../../utils/cfs'
import PropTypes from 'prop-types'
import {
  View
  ScrollView
} from 'remax/wechat'

C = CFX {
  View
  ScrollView
}

ENV = Taro.getEnv()
MIN_DISTANCE = 100
MAX_INTERVAL = 10

export default (props) =>
  constructor = () =>
    [
      _scrollLeft: '',
      _scrollTop: '',
      _scrollIntoView: ''
    ] = state
    _tabId = if isTest() then 'tabs-AOTU2018' else uuid()
    # // 触摸时的原点
    _touchDot = 0
    # // 定时器
    _timer = null
    # // 滑动时间间隔
    _interval = 0
    # // 是否已经在滑动
    _isMoving = false

  updateState = (idx) =>
    if props.scroll
      switch ENV  
        