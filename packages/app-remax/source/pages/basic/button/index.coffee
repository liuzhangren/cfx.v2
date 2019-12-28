import React, {
  useState
  useEffect
} from 'react'

import {
  View
  Text
} from 'remax/wechat'

import CFX from '../../../utils/cfx'
import CFS from '../../../utils/cfs'

import clsx from 'clsx'
import styl from 'cfx.styl'
import style from './index.cfs'
import './index.cfs.css'
import AtButton from '../../../components/button'

C = CFX {
  AtButton
}

export default () =>
  C.AtButton
    type: 'primary'
  , '按钮'
