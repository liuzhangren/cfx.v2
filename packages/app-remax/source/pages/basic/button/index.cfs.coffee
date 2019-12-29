export default ({
  cfs: {
    px
    vh
    joinS: js
    rgba
    calc
    color: c
  }
}) =>
  
  myButton:
    color: 'red'
  atButton:
    color: 'red'
  pannelContent:
    '&.demoButton':
      atForm:
        paddingLeft: 0
  btnDemoFab:
    position: 'fixed'
    right: px 32
    bottom: px 32
    zIndex: 1100
  btnItem:
    marginBottom: px 20

    '&:last-child': 
      marginBottom: 0
    
    subitem: 
      display: 'inline-block'
      marginLeft: px 24

      '&:first-child': 
        marginLeft: 0