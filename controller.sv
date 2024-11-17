module controller(fun3, fun7, opcode, reg_write, mem_read, mem_write, mem_to_reg, ALU_op, ALU_src, branch_ctrl, mem_ctrl);
	input logic [2:0]fun3;
	input logic [6:0]fun7;
	input logic [6:0]opcode;
	output logic reg_write;
	output logic mem_read, mem_write;
	output logic [1:0] mem_to_reg;
	output logic [2:0] branch_ctrl;
	output logic [2:0] mem_ctrl;
	output logic ALU_src;
	output logic [3:0] ALU_op;
	
	always_comb
		case(opcode)
			7'b0110011: begin // R-type
				reg_write = 1'b1;
				mem_read = 1'b0;
				mem_write = 1'b0;
				mem_to_reg = 2'b01;
				ALU_src = 1'b1;
				
				branch_ctrl = 3'bXXX;
				mem_ctrl = 3'bXXX;
				case(fun3)
					3'b000: begin 
						if(fun7 == 7'b0) 
							ALU_op = 4'b0000; //ADD
						else
							ALU_op = 4'b1000; //SUB 
					end
					3'b101: begin
						if(fun7 == 7'b0)  
							ALU_op = 4'b0101; //SRL
						else
							ALU_op = 4'b1101; //SRA
					end
					3'b001, 3'b010, 3'b011, 3'b100, 3'b110, 3'b111: if(fun7 == 7'b0)
						ALU_op = {1'b0, fun3[2:0]};
					else
						ALU_op = 4'bX;
					default: ALU_op = 4'bXXXX; // No ALU usage, malformed instruction
				endcase
			end
			7'b0010011: begin // I-type (IR-type)
				reg_write = 1'b1;
				mem_read = 1'b0;
				mem_write = 1'b0;
				mem_to_reg = 2'b01;
				ALU_src = 1'b1;
				
				branch_ctrl = 3'bXXX;
				mem_ctrl = 3'bXXX;
				case(fun3)
					3'b101: begin
						if(fun7 == 7'b0)  
							ALU_op = 4'b0101; //SRL
						else
							ALU_op = 4'b1101; //SRA
					end
					3'b000, 3'b001, 3'b010, 3'b011, 3'b100, 3'b110, 3'b111: if(fun7 == 7'b0)
						ALU_op = {1'b0, fun3[2:0]};
					else
						ALU_op = 4'bX;
					default: ALU_op = 4'bXXXX; // No ALU usage, malformed instruction
				endcase
			end
			7'b0000011: begin // Loads (IL-type)
				reg_write = 1'b1;
				mem_read = 1'b1;
				mem_write = 1'b0;
				mem_to_reg = 2'b00;
				ALU_src = 1'b1;
				
				branch_ctrl = 3'bXXX;
				ALU_op = 4'b0000;
				case(fun3)
					3'b000: mem_ctrl = 3'b000; // LB
					3'b001: mem_ctrl = 3'b001; // LH
					3'b010: mem_ctrl = 3'b010; // LW
					3'b100: mem_ctrl = 3'b011; // LBU
					3'b101: mem_ctrl = 3'b100; // LHU
					default: mem_ctrl = 3'bX; 
				endcase
			end
			7'b0100011: begin // S-type
				reg_write = 1'b0;
				mem_read = 1'b0;
				mem_write = 1'b1;
				mem_to_reg = 2'bX;
				ALU_src = 1'b1;
				
				branch_ctrl = 3'bXXX;
				ALU_op = 4'b0000;
				case(fun3)
					3'b000: mem_ctrl = 3'b101; // SB
					3'b001: mem_ctrl = 3'b110; // SH
					3'b010: mem_ctrl = 3'b111; // SW
					default: mem_ctrl = 3'bX;  // 
				endcase
			end
			endcase 
			
			endmodule