`timescale 1ns/1ps

module tb_ldpc_edgetable;

  reg clk;
  reg rst;
  reg [12:0] romaddr;
  wire [16:0] romdata;

  // Instantiate the unit under test (UUT)
  ldpc_edgetable uut (
    .clk(clk),
    .rst(rst),
    .romaddr(romaddr),
    .romdata(romdata)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    rst = 1;
    romaddr = 0;
    #10; // Wait for reset to take effect

    // Release reset
    rst = 0;
    #10;

    // Test all addresses
    for (romaddr = 0; romaddr < 1024; romaddr = romaddr + 1) begin
      #10; // Wait for clock edge
      case (romaddr)
        0: if (romdata !== 17'h15) $display("FAIL: Address %d, expected 0x15, got 0x%h", romaddr, romdata);
        1: if (romdata !== 17'h150) $display("FAIL: Address %d, expected 0x150, got 0x%h", romaddr, romdata);
        2: if (romdata !== 17'h2f4) $display("FAIL: Address %d, expected 0x2f4, got 0x%h", romaddr, romdata);
        3: if (romdata !== 17'h4ec) $display("FAIL: Address %d, expected 0x4ec, got 0x%h", romaddr, romdata);
        4: if (romdata !== 17'h708) $display("FAIL: Address %d, expected 0x708, got 0x%h", romaddr, romdata);
        5: if (romdata !== 17'h9fc) $display("FAIL: Address %d, expected 0x9fc, got 0x%h", romaddr, romdata);
        6: if (romdata !== 17'hc54) $display("FAIL: Address %d, expected 0xc54, got 0x%h", romaddr, romdata);
        7: if (romdata !== 17'hef7) $display("FAIL: Address %d, expected 0xef7, got 0x%h", romaddr, romdata);
        8: if (romdata !== 17'h11c7) $display("FAIL: Address %d, expected 0x11c7, got 0x%h", romaddr, romdata);
        9: if (romdata !== 17'h14b5) $display("FAIL: Address %d, expected 0x14b5, got 0x%h", romaddr, romdata);
        10: if (romdata !== 17'h1749) $display("FAIL: Address %d, expected 0x1749, got 0x%h", romaddr, romdata);
        11: if (romdata !== 17'h19e3) $display("FAIL: Address %d, expected 0x19e3, got 0x%h", romaddr, romdata);
        12: if (romdata !== 17'h1a2b) $display("FAIL: Address %d, expected 0x1a2b, got 0x%h", romaddr, romdata);
        13: if (romdata !== 17'h1a94) $display("FAIL: Address %d, expected 0x1a94, got 0x%h", romaddr, romdata);
        14: if (romdata !== 17'h1b12) $display("FAIL: Address %d, expected 0x1b12, got 0x%h", romaddr, romdata);
        15: if (romdata !== 17'h1b7b) $display("FAIL: Address %d, expected 0x1b7b, got 0x%h", romaddr, romdata);
        16: if (romdata !== 17'h1c38) $display("FAIL: Address %d, expected 0x1c38, got 0x%h", romaddr, romdata);
        17: if (romdata !== 17'h1cce) $display("FAIL: Address %d, expected 0x1cce, got 0x%h", romaddr, romdata);
        18: if (romdata !== 17'h1d5b) $display("FAIL: Address %d, expected 0x1d5b, got 0x%h", romaddr, romdata);
        19: if (romdata !== 17'h1de7) $display("FAIL: Address %d, expected 0x1de7, got 0x%h", romaddr, romdata);
        20: if (romdata !== 17'h1e85) $display("FAIL: Address %d, expected 0x1e85, got 0x%h", romaddr, romdata);
        21: if (romdata !== 17'h1687) $display("FAIL: Address %d, expected 0x1687, got 0x%h", romaddr, romdata);
        // Add more cases as needed for other addresses
        default: if (romdata !== 17'h4ea) $display("FAIL: Address %d, expected 0x4ea, got 0x%h", romaddr, romdata);
      endcase
    end

    // Check reset functionality
    rst = 1;
    #10; // Wait for reset to take effect
    if (romdata !== 17'h0) $display("FAIL: After reset, expected 0x0, got 0x%h", romdata);
    
    // End simulation
    $display("PASS");
    $finish;
  end

endmodule