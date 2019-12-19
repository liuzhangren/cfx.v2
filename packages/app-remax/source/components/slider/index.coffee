import React { useState, useEffect} from React
import classNames from 'classnames'
import CFX  from '../../utils/cfx'
import CFS from '../../utils/cfs'
import PropTypes from 'prop-types'
# import AtComponent from '../../common/component'

import {
  View
  Slider
} from 'remax/wechat'

C = CFX {
  View
  Slider
}

export default (props) =>
  # constructor (props) {
  #   super(...arguments)

  #   const { value, min, max } = props
  #   this.state = {
  #     _value: AtSlider.clampNumber(value, min, max)
  #   }
  # }

  # static clampNumber (value, lower, upper) {
  #   return Math.max(lower, Math.min(upper, value))
  # }
  handleChanging = (e) =>
    _value = state
    value = e.detail

    if value !== _value
    then setState { _value:value }

    props.onChanging { value }

  handleChange = (e) =>
    value = e.detail
    setState {_value:value}
    props.onChange {value}
  
  # componentWillReceiveProps (props) {
  #   const { value, min, max } = props
  #   this.setState({
  #     _value: AtSlider.clampNumber(value, min, max)
  #   })
  # }

  [
    customStyle
    className
    min
    max
    step
    disabled
    activeColor
    backgroundColor
    blockSize
    blockColor
    showValue
  ] = props

  C.View
    className: classNames {
      'at-slider': true
      'at-slider--disabled': disabled
    },className
    style: customStyle
  ,
    C.View
      className: 'at-slider__inner'
    ,
      C.Slider
        min : min
        max : max
        step : step
        value : _value
        disabled : disabled
        activeColor : activeColor
        backgroundColor : backgroundColor
        blockSize : blockSize
        blockColor : blockColor
        onChanging : handleChanging.bind this
        onChange : handleChange.bind this
    showValue and C.View
      className: 'at-slider__text'
      , "#{_value}"