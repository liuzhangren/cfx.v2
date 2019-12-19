import React { useState, useEffect} from React
import classNames from 'classnames'
import CFX  from '../../utils/cfx'
import CFS from '../../utils/cfs'
import PropTypes from 'prop-types'

# import AtActivityIndicator from '../../components/activity-indicator/index'
# import AtButton from '../../components/button/index'
# import AtComponent from '../../common/component'

import {
  View
  Text
} from 'remax/wechat'

C = CFX {
  View
  Text
  AtActivityIndicator
}

export default (props) =>
  [
    className
    customStyle
    loadingText
    moreText
    status
    moreBtnStyle
    noMoreTextStyle
    noMoreText
  ] = props

  component = null
  
  if status === 'loading'
    component = C.AtActivityIndicator
      mode: 'center'
      content: 'loadingText'
  else if status === 'more'
    component = (
      C.View
        className: 'at-load-more__cnt'
      ,
        C.AtButton {
          full
          onClick:onClick.bind this
          customStyle:moreBtnStyle
        }
    )
  else
    component = C.Text
      className: 'at-load-more__tip'
      style: noMoreTextStyle
    , noMoreText

  return
    C.View
      className: classNames 'at-load-more',className
      style: customStyle
    , component
