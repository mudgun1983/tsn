typedef enum{OAM,PTP,L2ALARM}business_kind_e;  
typedef enum{BHH_VS,BHH_VP,BHH_VC}bhh_kind_e;  
typedef enum{OTH_OAM,OTH_PTP}oth_type_e;
typedef enum{DOWN_MEP,UP_MEP}oth_mep_type_e;
typedef enum bit[2:0]{NONE                =3'b000,
                      OTH_LM              =3'b001,
                      DM_1588             =3'b010,
                      DM_NTP              =3'b011,
                      OTH_CCM             =3'b100,
                      OTH_LB              =3'b101
                     }oth_oam_sub_type_e;
typedef enum{NO_USER_HEADER,USER_HEADER_16,USER_HEADER_32}user_header_type_e;
typedef enum{L2_MUTI,L3_MUTI,L3_UNI}ptp_kind_e;
typedef enum{IPV4,IPV6,RAW}ip_header_kind_e;  

//typedef enum{NO_PKT_ERROR,SINGLE_PKT_ERROR,MULTI_PKT_ERROR}eth_pkt_error_mode;
//typedef enum{NO_PROT_ERROR,SINGLE_PROT_ERROR_KIND,MULTI_PROT_ERROR_KIND}eth_protocol_error_mode;
//typedef enum{RANDOM_PROT_ERROR,DIRECTED_PROT_ERROR}eth_protocol_error_gen_mode;
typedef enum bit[2:0]{CFM_UP,CFM_DOWN,TP_VS,TP_VP,TP_VC,PTP_L2_MUTI,PTP_L3_MUTI,PTP_L3_UNI}pkt_type_e;

 typedef enum {RAMDOM_DATA,ETHERNET}     eth_packet_format          ;
  typedef enum {MAC,PHY}                  eth_agent_kind             ;
  typedef enum {INJECT,COLLECT}           eth_direction              ;
  typedef enum {ETHERNET_802_3        ,                              
  	            ETHERNET_VII          ,                              
  	            EHTERNET_PAUSE        ,                              
  	            ETHERNET_MAGIC        ,                              
  	            ETHERNET_JUMBO        ,                              
  	            ETHERNET_SNAP}            eth_packet_kind            ;
  typedef enum {NO_PKT_ERROR          ,                              
  	            SINGLE_PKT_ERROR      ,                              
  	            MULTI_PKT_ERROR}          eth_pkt_error_mode         ;
  typedef enum {NO_PROT_ERROR         ,   
  	            SINGLE_PROT_ERROR_KIND,   
  	            MULTI_PROT_ERROR_KIND}    eth_protocol_error_mode    ;
  typedef enum {RANDOM_PROT_ERROR     ,   
  	            DIRECTED_PROT_ERROR}      eth_protocol_error_gen_mode;
  typedef enum {VLAN_TAG,                 
  	            VLAN_DOUBLE_TAG       ,   
  	            UNTAGGED}                 eth_tag_kind               ;
  typedef enum {MII,GMII,RMII,XGMII   ,                              
  	            SMII,XAUI,TBI,SGMII   ,                              
  	            XSBI,RGMII,RTBI}          eth_interface_kind         ;
  typedef enum {HALF,FULL}                eth_duplex_mode            ;  
//  typedef enum {ADD,WRITE,READ        ,   
//  	            READ_INC}                 eth_management_packet_kind ;
  typedef enum {UNICAST,MULTICAST     ,   
  	            BROADCAST}                eth_dest_addr_kind         ;  
  typedef enum {PCS_LAYER,PMA_LAYER}      eth_sub_layer_kind         ;
  typedef enum {SPEED_MODE_10MBPS     ,                              
  	            SPEED_MODE_100MBPS    ,                              
  	            SPEED_MODE_1GBPS      ,                              
  	            SPEED_MODE_10GBPS}        eth_speed_mode             ;
  typedef enum {TX_STATION,RX_STATION}    eth_station_kind           ;