CK_TWITTER = 'TTKmfnSiBFe5souT2ptWaA'
CS_TWITTER = 'kEUxVm1v2P0bpnJLUrGTjamBQtvy25vCgHg4deYo'

CK_FOURSQUARE = 'TYZMZVK5UODORNIZTOOTQC4JXA1OL1QPQDSABGMB1ZTWZHR4'
CS_FOURSQUARE = '3VJ30SFI0EO1AFGAERWVM2002FGQYRUKRR1MUN1DPD2EPSCS'

CK_FACEBOOK =  '194525743983363'
CS_FACEBOOK	= 'aa67a448ba9efbde5d1ba5d30e7bbb10'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, CK_TWITTER , CS_TWITTER
  provider :foursquare, CK_FOURSQUARE, CS_FOURSQUARE 
  provider :facebook, CK_FACEBOOK, CS_FACEBOOK 
end