import React { useState, useEffect} from React
import classNames from 'classnames'
import CFX  from '../../utils/cfx'
import CFS from '../../utils/cfs'
import PropTypes from 'prop-types'

# import AtButton from '../button/index'
# import AtComponent from '../../common/component'

import {
  View
  Text
} from 'remax/wechat'

C = CFX {
  View
  Text
  AtButton
}

MIN_MAXPAGE =1

getMaxPage = (maxPage = 0) =>
  if maxPage <= 0
    return MIN_MAXPAGE
  return maxPage

createPickerRange = (max) =>
  range = new Array(max).fill(0).map (val,index) => index + 1

export default (props) =>
  onPrev {
    currentPage = state
    originCur = currentPage
    currentPage -= 1
    currentPage = Math.max 1,currentPage
    if originCur=== currentPage
    then props.onPageChange and props.onPageChange {
      type: 'prev'
      current: currentPage
    }
    setState {currentPage}
  }

  onNext {
    currentPage = state
    originCur = currentPage
    currentPage += 1
    currentPage = Math.min maxPage,currentPage
    if originCur=== currentPage
    then props.onPageChange and props.onPageChange {
      type: 'next'
      current: currentPage
    }
    setState {currentPage}
  }

  #   componentWillReceiveProps (props) {
  #   const { total, pageSize, current } = props
  #   const maxPage = getMaxPage(Math.ceil(total / pageSize))
  #   if (maxPage !== this.state.maxPage) {
  #     this.setState({
  #       maxPage,
  #       pickerRange: createPickerRange(maxPage),
  #     })
  #   }
  #   if (current !== this.state.currentPage) {
  #     this.setState({ currentPage: current })
  #   }
  # }

  [
    icon
    customStyle
  ] = props

  [
    currentPage
    maxPage
  ] = state

  rootClassName = ['at-pagination']

  prevDisabled = maxPage === MIN_MAXPAGE || currentPage === 1
  nextDisabled = maxPage === MIN_MAXPAGE || currentPage === maxPage

  classObject =
    'at-pagination--icon': icon

  C.View
    className: classNames rootClassName,classObject,props.className
    style: customStyle
  ,
    C.View
      className: 'at-pagination__btn-prev'
    , 
      icon and C.AtButton
        onClick: onPrev.bind this
        size: 'small'
        disable: prevDisabled
      ,
        C.Text
          className: 'at-icon at-icon-chevron-left'
      !icon and C.AtButton
        onClick: onPrev.bind this
        size: 'small'
        disable: prevDisabled
      , '上一页'

    C.View
      className: 'at-pagination__number'
    ,
      C.Text
        className: 'at-pagination__number-current'
      , currentPage
      / maxPage
    C.View
      className: 'at-pagination__btn-next'
    ,
      icon and C.AtButton
        onClick: onNext.bind this
        size: 'small'
        disable: nextDisabled
      ,
        C.Text
          className: 'at-icon at-icon-chevron-right'
      !icon and C.AtButton
        onClick: onNext.bind this
        size: 'small'
        disable: nextDisabled
      , '下一页'
