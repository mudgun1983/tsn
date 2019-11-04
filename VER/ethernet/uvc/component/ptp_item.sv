

`ifndef PTP_ITEM_SV
`define PTP_ITEM_SV


//------------------------------------------------------------------------------
//
// CLASS: pcs_item
//
//------------------------------------------------------------------------------

class ptp_item extends uvm_sequence_item;
   
//==================== Enum ======================//
//typedef typedef enum {,,} enum_name
typedef enum {Sync                  ,//Event  0
              Delay_Req             ,//Event  1
              Pdelay_Req            ,//Event  2
              Pdelay_Resp           ,//Event  3
              Follow_Up             ,//General 8
              Delay_Resp            ,//General 9
              Pdelay_Resp_Follow_Up ,//General A
              Announce              ,//General B
              Signaling             ,//General C
              Management            //General D
              
} packet_kind;
//==================== Enum ======================//


//==================== Knob ======================//
//randc enum_name kind_name;
randc packet_kind packet_type;    
//==================== Knob ======================//


//==================== Attribute =================// 
    //Common message header
    
	rand bit[(4*1-1):0] transportSpecific             ;
	rand bit[(4*1-1):0] messageType                   ;//1 0
	rand bit[(4*1-1):0] reserved0                     ;
	rand bit[(4*1-1):0] versionPTP                    ;//1 1  
    rand bit[(8*2-1):0] messageLength                 ;//2 2
    rand bit[(8*1-1):0] domainNumber                  ;//1 4
    rand bit[(8*1-1):0] reserved1                     ;//1 5
    rand bit[(8*2-1):0] flagField                     ;//2 6
    rand bit[(8*8-1):0] correctionField               ;//8 8
    rand bit[(8*4-1):0] reserved2                     ;//4 16
    rand bit[(8*1-1):0] sourcePortIdentity            ;//10 20
    rand bit[(8*2-1):0] sequenceId                    ;//2 30
    rand bit[(8*1-1):0] controlField                  ;//1 32
    rand bit[(8*1-1):0] logMessageInterval            ;//1
    
	//Sync and Delay_Req message fields
	rand bit [8*10-1:0] originTimestamp;
	
	//Follow_Up message fields
	rand bit [8*10-1:0] preciseOriginTimestamp;
	
	//Delay_Resp message fields
	rand bit [8*10-1:0] receiveTimestamp       ;//10 34
    rand bit [8*10-1:0] requestingPortIdentity ;//10
	
	//Pdelay_Req message fields
	//rand bit [8*10-1:0] originTimestamp ;//10 34
    rand bit [8*10-1:0] reserved        ;//10
	
	//Pdelay_Resp message fields
	rand bit [8*10-1:0] requestReceiptTimestamp ;//10 34
    //rand bit [8*10-1:0] requestingPortIdentity  ;//10
	
	//Pdelay_Resp_Follow_Up message fields
	rand bit [8*10-1:0] responseOriginTimestamp ;//10 34
    //rand bit [8*10-1:0] requestingPortIdentity  ;//10
	
	rand bit[7:0]    frame_data[];
 //==================== Attribute =================//


//==================== Registration ==============//
    `uvm_object_utils_begin(ptp_item)
         `uvm_field_int(messageType                  , UVM_ALL_ON|UVM_NOPACK)                        
         `uvm_field_int(transportSpecific            , UVM_ALL_ON|UVM_NOPACK)
         `uvm_field_int(versionPTP                   , UVM_ALL_ON|UVM_NOPACK)
		 `uvm_field_int(reserved0                    , UVM_ALL_ON|UVM_NOPACK)      
		 `uvm_field_int(messageLength                , UVM_ALL_ON|UVM_NOPACK)
		 `uvm_field_int(domainNumber                 , UVM_ALL_ON|UVM_NOPACK)
		 `uvm_field_int(reserved1                    , UVM_ALL_ON|UVM_NOPACK)
		 `uvm_field_int(flagField                    , UVM_ALL_ON|UVM_NOPACK)
		 `uvm_field_int(correctionField              , UVM_ALL_ON|UVM_NOPACK)
		 `uvm_field_int(reserved2                    , UVM_ALL_ON|UVM_NOPACK)
		 `uvm_field_int(sourcePortIdentity           , UVM_ALL_ON|UVM_NOPACK)
		 `uvm_field_int(sequenceId                   , UVM_ALL_ON|UVM_NOPACK)
		 `uvm_field_int(controlField                 , UVM_ALL_ON|UVM_NOPACK)
		 `uvm_field_int(logMessageInterval           , UVM_ALL_ON|UVM_NOPACK)
		 
		 `uvm_field_int(originTimestamp              , UVM_ALL_ON|UVM_NOPACK)
		 `uvm_field_int(preciseOriginTimestamp       , UVM_ALL_ON|UVM_NOPACK)
		 `uvm_field_int(receiveTimestamp             , UVM_ALL_ON|UVM_NOPACK)
		 `uvm_field_int(requestingPortIdentity       , UVM_ALL_ON|UVM_NOPACK)
	     `uvm_field_int(reserved                     , UVM_ALL_ON|UVM_NOPACK)
	     `uvm_field_int(requestReceiptTimestamp      , UVM_ALL_ON|UVM_NOPACK)
		 `uvm_field_int(responseOriginTimestamp      , UVM_ALL_ON|UVM_NOPACK)
		 
		 `uvm_field_array_int(frame_data             , UVM_ALL_ON|UVM_NOPACK)		 
         `uvm_field_enum(packet_kind , packet_type   , UVM_ALL_ON|UVM_NOPACK) 
    `uvm_object_utils_end
//==================== Registration ==============//



//==================== Constraint ================//
//    constraint c_ach_cw {
//                    ach_cw == 4'b0001;
//                           }
     constraint c_messageType {
					    (packet_type==Sync                  )->  messageType == 'h0 ;
						(packet_type==Delay_Req             )->  messageType == 'h1 ;
						(packet_type==Pdelay_Req            )->  messageType == 'h2 ;
						(packet_type==Pdelay_Resp           )->  messageType == 'h3 ;
						(packet_type==Follow_Up             )->  messageType == 'h8 ;
						(packet_type==Delay_Resp            )->  messageType == 'h9 ;
						(packet_type==Pdelay_Resp_Follow_Up )->  messageType == 'hA ;
						(packet_type==Announce              )->  messageType == 'hB ;
						(packet_type==Signaling             )->  messageType == 'hC ;
						(packet_type==Management            )->  messageType == 'hD ;								                    
                           }
                                      
//==================== Constraint ================//



//================================================//
//FUNCTION    : new
//DESCRIPTION : construct
//================================================//
    function new (string name = "pcs_item");               
        super.new();                    
    endfunction:new 

//================================================//
//FUNCTION    : do_pack
//DESCRIPTION : do_pack
//================================================//
    function void do_pack(uvm_packer packer);
        super.do_pack(packer);  
		
		 packer.pack_field_int (messageType        ,4*1);
		 packer.pack_field_int (transportSpecific  ,4*1);
		 packer.pack_field_int (versionPTP         ,4*1);
		 packer.pack_field_int (reserved0          ,4*1);
		 packer.pack_field_int (messageLength      ,8*2);
		 packer.pack_field_int (domainNumber       ,8*1);
		 packer.pack_field_int (reserved1          ,8*1);
		 packer.pack_field_int (flagField          ,8*2);
		 packer.pack_field_int (correctionField    ,8*8);
		 packer.pack_field_int (reserved2          ,8*4);
		 packer.pack_field_int (sourcePortIdentity ,8*1);
		 packer.pack_field_int (sequenceId         ,8*2);
		 packer.pack_field_int (controlField       ,8*1);
		 packer.pack_field_int (logMessageInterval ,8*1);
		 
		case(packet_type)
		     Sync       :packer.pack_field(originTimestamp,80);  
			 Delay_Req  :packer.pack_field(originTimestamp,80);  
			 Delay_Resp :begin
			               packer.pack_field(receiveTimestamp,80);
						   packer.pack_field(requestingPortIdentity,80);
			             end
			 Pdelay_Req :begin
			               packer.pack_field(originTimestamp,80);
						   packer.pack_field(reserved,80);
						 end
			 Pdelay_Resp:begin
			               packer.pack_field(requestReceiptTimestamp,80);
						   packer.pack_field(requestingPortIdentity,80);
			             end
			 Follow_Up  :begin
			               packer.pack_field(preciseOriginTimestamp,80);		               
			             end         
		endcase
    endfunction


endclass 

`endif // 
