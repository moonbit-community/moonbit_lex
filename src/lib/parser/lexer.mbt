
///|
struct Lexbuf {
   content : String
   mut pos : Int
 }

///|
pub fn Lexbuf::from_string(content : String) -> Lexbuf {
   { content, pos: 0 }
 }

// NOTE: MoonBit do have unboxed Option[Char] optimization
///|
fn next(self : Lexbuf) -> Char? {
   if self.pos < self.content.length() {
     let ch = self.content[self.pos]
     self.pos += 1
     Some(ch)
   } else {
     None
   }
 }

///|
fn substring(self : Lexbuf, start : Int, end : Int) -> String {
   self.content.substring(start~, end~)
 }

///|
typealias LexTagAction = Array[Array[Int]]

///|
typealias LexState = Int

///|
typealias LexInput = Int

///|
pub(all) struct LexEngine {
   graph : Array[(LexState) -> (LexState, LexTagAction)]
   end_nodes : Array[(Int, Array[((Int, Int), (Int, Int))])?]
   start_tags : Array[Int]
   code_blocks_n : Int
 }

///|
pub fn run(self : LexEngine, lexbuf : Lexbuf) -> (Int, Array[(Int, Int)]) {
   let mut state = 0
   let mut tagState : Array[Array[Int]] = []
   let backtrace = Array::make(self.code_blocks_n, None)
   for tag in self.start_tags {
     while tagState.length() <= tag {
       tagState.push([])
     }
     tagState[tag].push(lexbuf.pos)
   }
   while state != -1 {
     match self.end_nodes[state] {
       Some(t) => backtrace[t.0] = Some((lexbuf.pos, state, tagState))
       _ => ()
     }
     let b = match lexbuf.next() {
       Some(b) => b.to_int()
       None => -1
     }
     let next = self.graph[state](b)
     state = next.0
     let new_tagState : Array[Array[Int]] = []
     for i = 0; i < next.1.length(); i = i + 1 {
       new_tagState.push([])
       for j = 0; j < next.1[i].length(); j = j + 1 {
         let t = next.1[i][j]
         if t == -1 {
           new_tagState[i].push(lexbuf.pos)
         } else {
           new_tagState[i].push(tagState[i][t])
         }
       }
     }
     tagState = new_tagState
   }
   for index, b in backtrace {
     match b {
       Some((p, state, tagState)) => {
         lexbuf.pos = p
         let captures = self.end_nodes[state].unwrap().1.map(fn {
           ((b_t, b_r), (e_t, e_r)) => (tagState[b_t][b_r], tagState[e_t][e_r])
         })
         break (index, captures)
       }
       None => ()
     }
   } else {
     (self.code_blocks_n, [])
   }
 }




let token_tag_action_row_0 : Array[Int] = []
let token_tag_action_row_1 : Array[Int] = [-1]
let token_tag_action_row_2 : Array[Int] = [0]

let token_tag_action_1 : Array[Array[Int]] = [token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0]
let token_tag_action_0 : Array[Array[Int]] = [token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_1, token_tag_action_row_0]
let token_tag_action_3 : Array[Array[Int]] = [token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_2, token_tag_action_row_1]
let token_tag_action_10 : Array[Array[Int]] = [token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_1, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0]
let token_tag_action_12 : Array[Array[Int]] = [token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_2, token_tag_action_row_1, token_tag_action_row_0, token_tag_action_row_0]
let token_tag_action_15 : Array[Array[Int]] = [token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_2, token_tag_action_row_2, token_tag_action_row_0, token_tag_action_row_0]
let token_tag_action_6 : Array[Array[Int]] = [token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_1, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0]
let token_tag_action_9 : Array[Array[Int]] = [token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_2, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0]
let token_tag_action_17 : Array[Array[Int]] = [token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_2, token_tag_action_row_1, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0]
let token_tag_action_19 : Array[Array[Int]] = [token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_2, token_tag_action_row_2, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0]
let token_tag_action_7 : Array[Array[Int]] = [token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_1, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0]
let token_tag_action_8 : Array[Array[Int]] = [token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_2, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0]
let token_tag_action_11 : Array[Array[Int]] = [token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_2, token_tag_action_row_1, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0]
let token_tag_action_14 : Array[Array[Int]] = [token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_2, token_tag_action_row_2, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0]
let token_tag_action_2 : Array[Array[Int]] = [token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_1, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0]
let token_tag_action_4 : Array[Array[Int]] = [token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_2, token_tag_action_row_1, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0]
let token_tag_action_5 : Array[Array[Int]] = [token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_2, token_tag_action_row_2, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0]
let token_tag_action_13 : Array[Array[Int]] = [token_tag_action_row_1, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0]
let token_tag_action_16 : Array[Array[Int]] = [token_tag_action_row_2, token_tag_action_row_1, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0]
let token_tag_action_18 : Array[Array[Int]] = [token_tag_action_row_2, token_tag_action_row_2, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0]

fn token_state_0(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     9..=10 => (2, token_tag_action_0)
     13 => (2, token_tag_action_0)
     32 => (2, token_tag_action_0)
     34 => (3, token_tag_action_1)
     39 => (4, token_tag_action_2)
     40 => (16, token_tag_action_1)
     41 => (15, token_tag_action_1)
     42 => (9, token_tag_action_1)
     43 => (8, token_tag_action_1)
     45 => (6, token_tag_action_1)
     47 => (25, token_tag_action_1)
     59 => (11, token_tag_action_1)
     61 => (12, token_tag_action_1)
     63 => (7, token_tag_action_1)
     91 => (14, token_tag_action_1)
     93 => (13, token_tag_action_1)
     94 => (5, token_tag_action_1)
     95 => (19, token_tag_action_3)
     97 => (20, token_tag_action_3)
     98..=100 => (1, token_tag_action_3)
     101 => (24, token_tag_action_3)
     102..=107 => (1, token_tag_action_3)
     108 => (21, token_tag_action_3)
     109..=111 => (1, token_tag_action_3)
     112 => (22, token_tag_action_3)
     113 => (1, token_tag_action_3)
     114 => (23, token_tag_action_3)
     115..=122 => (1, token_tag_action_3)
     123 => (18, token_tag_action_1)
     124 => (10, token_tag_action_1)
     125 => (17, token_tag_action_1)
     _ => (-1, [])
   }
 }
fn token_state_1(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     48..=57 => (26, token_tag_action_3)
     65..=90 => (26, token_tag_action_3)
     95 => (26, token_tag_action_3)
     97..=122 => (26, token_tag_action_3)
     _ => (-1, [])
   }
 }
fn token_state_2(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     9..=10 => (2, token_tag_action_0)
     13 => (2, token_tag_action_0)
     32 => (2, token_tag_action_0)
     34 => (3, token_tag_action_1)
     39 => (4, token_tag_action_2)
     40 => (16, token_tag_action_1)
     41 => (15, token_tag_action_1)
     42 => (9, token_tag_action_1)
     43 => (8, token_tag_action_1)
     45 => (6, token_tag_action_1)
     47 => (25, token_tag_action_1)
     59 => (11, token_tag_action_1)
     61 => (12, token_tag_action_1)
     63 => (7, token_tag_action_1)
     91 => (14, token_tag_action_1)
     93 => (13, token_tag_action_1)
     94 => (5, token_tag_action_1)
     95 => (19, token_tag_action_3)
     97 => (20, token_tag_action_3)
     98..=100 => (1, token_tag_action_3)
     101 => (24, token_tag_action_3)
     102..=107 => (1, token_tag_action_3)
     108 => (21, token_tag_action_3)
     109..=111 => (1, token_tag_action_3)
     112 => (22, token_tag_action_3)
     113 => (1, token_tag_action_3)
     114 => (23, token_tag_action_3)
     115..=122 => (1, token_tag_action_3)
     123 => (18, token_tag_action_1)
     124 => (10, token_tag_action_1)
     125 => (17, token_tag_action_1)
     _ => (-1, [])
   }
 }
fn token_state_3(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     _ => (-1, [])
   }
 }
fn token_state_4(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     0..=38 => (27, token_tag_action_4)
     40..=91 => (27, token_tag_action_4)
     92 => (28, token_tag_action_1)
     93..=1114111 => (27, token_tag_action_4)
     _ => (-1, [])
   }
 }
fn token_state_5(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     _ => (-1, [])
   }
 }
fn token_state_6(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     _ => (-1, [])
   }
 }
fn token_state_7(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     _ => (-1, [])
   }
 }
fn token_state_8(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     _ => (-1, [])
   }
 }
fn token_state_9(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     _ => (-1, [])
   }
 }
fn token_state_10(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     _ => (-1, [])
   }
 }
fn token_state_11(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     _ => (-1, [])
   }
 }
fn token_state_12(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     62 => (29, token_tag_action_1)
     _ => (-1, [])
   }
 }
fn token_state_13(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     _ => (-1, [])
   }
 }
fn token_state_14(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     _ => (-1, [])
   }
 }
fn token_state_15(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     _ => (-1, [])
   }
 }
fn token_state_16(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     _ => (-1, [])
   }
 }
fn token_state_17(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     _ => (-1, [])
   }
 }
fn token_state_18(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     _ => (-1, [])
   }
 }
fn token_state_19(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     48..=57 => (26, token_tag_action_3)
     65..=90 => (26, token_tag_action_3)
     95 => (26, token_tag_action_3)
     97..=122 => (26, token_tag_action_3)
     _ => (-1, [])
   }
 }
fn token_state_20(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     48..=57 => (26, token_tag_action_3)
     65..=90 => (26, token_tag_action_3)
     95 => (26, token_tag_action_3)
     97..=114 => (26, token_tag_action_3)
     115 => (30, token_tag_action_3)
     116..=122 => (26, token_tag_action_3)
     _ => (-1, [])
   }
 }
fn token_state_21(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     48..=57 => (26, token_tag_action_3)
     65..=90 => (26, token_tag_action_3)
     95 => (26, token_tag_action_3)
     97..=100 => (26, token_tag_action_3)
     101 => (31, token_tag_action_3)
     102..=122 => (26, token_tag_action_3)
     _ => (-1, [])
   }
 }
fn token_state_22(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     48..=57 => (26, token_tag_action_3)
     65..=90 => (26, token_tag_action_3)
     95 => (26, token_tag_action_3)
     97 => (32, token_tag_action_3)
     98..=122 => (26, token_tag_action_3)
     _ => (-1, [])
   }
 }
fn token_state_23(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     48..=57 => (26, token_tag_action_3)
     65..=90 => (26, token_tag_action_3)
     95 => (26, token_tag_action_3)
     97..=116 => (26, token_tag_action_3)
     117 => (33, token_tag_action_3)
     118..=122 => (26, token_tag_action_3)
     _ => (-1, [])
   }
 }
fn token_state_24(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     48..=57 => (26, token_tag_action_3)
     65..=90 => (26, token_tag_action_3)
     95 => (26, token_tag_action_3)
     97..=110 => (26, token_tag_action_3)
     111 => (34, token_tag_action_3)
     112..=122 => (26, token_tag_action_3)
     _ => (-1, [])
   }
 }
fn token_state_25(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     47 => (35, token_tag_action_1)
     _ => (-1, [])
   }
 }
fn token_state_26(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     48..=57 => (26, token_tag_action_3)
     65..=90 => (26, token_tag_action_3)
     95 => (26, token_tag_action_3)
     97..=122 => (26, token_tag_action_3)
     _ => (-1, [])
   }
 }
fn token_state_27(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     39 => (36, token_tag_action_5)
     _ => (-1, [])
   }
 }
fn token_state_28(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     39 => (39, token_tag_action_1)
     92 => (45, token_tag_action_1)
     98 => (37, token_tag_action_1)
     110 => (43, token_tag_action_1)
     114 => (42, token_tag_action_1)
     116 => (40, token_tag_action_1)
     117 => (44, token_tag_action_6)
     118 => (38, token_tag_action_1)
     120 => (41, token_tag_action_7)
     _ => (-1, [])
   }
 }
fn token_state_29(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     _ => (-1, [])
   }
 }
fn token_state_30(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     48..=57 => (26, token_tag_action_3)
     65..=90 => (26, token_tag_action_3)
     95 => (26, token_tag_action_3)
     97..=122 => (26, token_tag_action_3)
     _ => (-1, [])
   }
 }
fn token_state_31(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     48..=57 => (26, token_tag_action_3)
     65..=90 => (26, token_tag_action_3)
     95 => (26, token_tag_action_3)
     97..=115 => (26, token_tag_action_3)
     116 => (46, token_tag_action_3)
     117..=122 => (26, token_tag_action_3)
     _ => (-1, [])
   }
 }
fn token_state_32(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     48..=57 => (26, token_tag_action_3)
     65..=90 => (26, token_tag_action_3)
     95 => (26, token_tag_action_3)
     97..=113 => (26, token_tag_action_3)
     114 => (47, token_tag_action_3)
     115..=122 => (26, token_tag_action_3)
     _ => (-1, [])
   }
 }
fn token_state_33(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     48..=57 => (26, token_tag_action_3)
     65..=90 => (26, token_tag_action_3)
     95 => (26, token_tag_action_3)
     97..=107 => (26, token_tag_action_3)
     108 => (48, token_tag_action_3)
     109..=122 => (26, token_tag_action_3)
     _ => (-1, [])
   }
 }
fn token_state_34(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     48..=57 => (26, token_tag_action_3)
     65..=90 => (26, token_tag_action_3)
     95 => (26, token_tag_action_3)
     97..=101 => (26, token_tag_action_3)
     102 => (49, token_tag_action_3)
     103..=122 => (26, token_tag_action_3)
     _ => (-1, [])
   }
 }
fn token_state_35(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     0..=9 => (50, token_tag_action_1)
     10 => (51, token_tag_action_1)
     11..=1114111 => (50, token_tag_action_1)
     _ => (-1, [])
   }
 }
fn token_state_36(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     _ => (-1, [])
   }
 }
fn token_state_37(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     39 => (52, token_tag_action_1)
     _ => (-1, [])
   }
 }
fn token_state_38(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     39 => (53, token_tag_action_1)
     _ => (-1, [])
   }
 }
fn token_state_39(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     39 => (54, token_tag_action_1)
     _ => (-1, [])
   }
 }
fn token_state_40(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     39 => (55, token_tag_action_1)
     _ => (-1, [])
   }
 }
fn token_state_41(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     48..=57 => (56, token_tag_action_8)
     65..=70 => (56, token_tag_action_8)
     97..=102 => (56, token_tag_action_8)
     _ => (-1, [])
   }
 }
fn token_state_42(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     39 => (57, token_tag_action_1)
     _ => (-1, [])
   }
 }
fn token_state_43(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     39 => (58, token_tag_action_1)
     _ => (-1, [])
   }
 }
fn token_state_44(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     48..=57 => (60, token_tag_action_9)
     65..=70 => (60, token_tag_action_9)
     97..=102 => (60, token_tag_action_9)
     123 => (59, token_tag_action_10)
     _ => (-1, [])
   }
 }
fn token_state_45(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     39 => (61, token_tag_action_1)
     _ => (-1, [])
   }
 }
fn token_state_46(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     48..=57 => (26, token_tag_action_3)
     65..=90 => (26, token_tag_action_3)
     95 => (26, token_tag_action_3)
     97..=122 => (26, token_tag_action_3)
     _ => (-1, [])
   }
 }
fn token_state_47(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     48..=57 => (26, token_tag_action_3)
     65..=90 => (26, token_tag_action_3)
     95 => (26, token_tag_action_3)
     97..=114 => (26, token_tag_action_3)
     115 => (62, token_tag_action_3)
     116..=122 => (26, token_tag_action_3)
     _ => (-1, [])
   }
 }
fn token_state_48(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     48..=57 => (26, token_tag_action_3)
     65..=90 => (26, token_tag_action_3)
     95 => (26, token_tag_action_3)
     97..=100 => (26, token_tag_action_3)
     101 => (63, token_tag_action_3)
     102..=122 => (26, token_tag_action_3)
     _ => (-1, [])
   }
 }
fn token_state_49(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     48..=57 => (26, token_tag_action_3)
     65..=90 => (26, token_tag_action_3)
     95 => (26, token_tag_action_3)
     97..=122 => (26, token_tag_action_3)
     _ => (-1, [])
   }
 }
fn token_state_50(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     0..=9 => (50, token_tag_action_1)
     10 => (51, token_tag_action_1)
     11..=1114111 => (50, token_tag_action_1)
     _ => (-1, [])
   }
 }
fn token_state_51(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     _ => (-1, [])
   }
 }
fn token_state_52(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     _ => (-1, [])
   }
 }
fn token_state_53(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     _ => (-1, [])
   }
 }
fn token_state_54(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     _ => (-1, [])
   }
 }
fn token_state_55(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     _ => (-1, [])
   }
 }
fn token_state_56(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     48..=57 => (64, token_tag_action_11)
     65..=70 => (64, token_tag_action_11)
     97..=102 => (64, token_tag_action_11)
     _ => (-1, [])
   }
 }
fn token_state_57(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     _ => (-1, [])
   }
 }
fn token_state_58(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     _ => (-1, [])
   }
 }
fn token_state_59(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     48..=57 => (65, token_tag_action_12)
     65..=70 => (65, token_tag_action_12)
     97..=102 => (65, token_tag_action_12)
     _ => (-1, [])
   }
 }
fn token_state_60(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     48..=57 => (66, token_tag_action_9)
     65..=70 => (66, token_tag_action_9)
     97..=102 => (66, token_tag_action_9)
     _ => (-1, [])
   }
 }
fn token_state_61(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     _ => (-1, [])
   }
 }
fn token_state_62(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     48..=57 => (26, token_tag_action_3)
     65..=90 => (26, token_tag_action_3)
     95 => (26, token_tag_action_3)
     97..=100 => (26, token_tag_action_3)
     101 => (67, token_tag_action_3)
     102..=122 => (26, token_tag_action_3)
     _ => (-1, [])
   }
 }
fn token_state_63(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     9..=10 => (68, token_tag_action_13)
     13 => (68, token_tag_action_13)
     32 => (68, token_tag_action_13)
     48..=57 => (26, token_tag_action_3)
     65..=90 => (26, token_tag_action_3)
     95 => (26, token_tag_action_3)
     97..=122 => (26, token_tag_action_3)
     _ => (-1, [])
   }
 }
fn token_state_64(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     39 => (69, token_tag_action_14)
     _ => (-1, [])
   }
 }
fn token_state_65(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     48..=57 => (65, token_tag_action_12)
     65..=70 => (65, token_tag_action_12)
     97..=102 => (65, token_tag_action_12)
     125 => (70, token_tag_action_15)
     _ => (-1, [])
   }
 }
fn token_state_66(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     48..=57 => (71, token_tag_action_9)
     65..=70 => (71, token_tag_action_9)
     97..=102 => (71, token_tag_action_9)
     _ => (-1, [])
   }
 }
fn token_state_67(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     9..=10 => (72, token_tag_action_1)
     13 => (72, token_tag_action_1)
     32 => (72, token_tag_action_1)
     48..=57 => (26, token_tag_action_3)
     65..=90 => (26, token_tag_action_3)
     95 => (26, token_tag_action_3)
     97..=122 => (26, token_tag_action_3)
     123 => (73, token_tag_action_1)
     _ => (-1, [])
   }
 }
fn token_state_68(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     9..=10 => (68, token_tag_action_13)
     13 => (68, token_tag_action_13)
     32 => (68, token_tag_action_13)
     95 => (74, token_tag_action_16)
     97..=122 => (74, token_tag_action_16)
     _ => (-1, [])
   }
 }
fn token_state_69(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     _ => (-1, [])
   }
 }
fn token_state_70(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     39 => (75, token_tag_action_15)
     _ => (-1, [])
   }
 }
fn token_state_71(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     48..=57 => (76, token_tag_action_17)
     65..=70 => (76, token_tag_action_17)
     97..=102 => (76, token_tag_action_17)
     _ => (-1, [])
   }
 }
fn token_state_72(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     9..=10 => (72, token_tag_action_1)
     13 => (72, token_tag_action_1)
     32 => (72, token_tag_action_1)
     123 => (73, token_tag_action_1)
     _ => (-1, [])
   }
 }
fn token_state_73(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     _ => (-1, [])
   }
 }
fn token_state_74(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     9..=10 => (77, token_tag_action_18)
     13 => (77, token_tag_action_18)
     32 => (77, token_tag_action_18)
     40 => (78, token_tag_action_18)
     48..=57 => (79, token_tag_action_16)
     65..=90 => (79, token_tag_action_16)
     95 => (79, token_tag_action_16)
     97..=122 => (79, token_tag_action_16)
     _ => (-1, [])
   }
 }
fn token_state_75(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     _ => (-1, [])
   }
 }
fn token_state_76(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     39 => (80, token_tag_action_19)
     _ => (-1, [])
   }
 }
fn token_state_77(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     9..=10 => (77, token_tag_action_18)
     13 => (77, token_tag_action_18)
     32 => (77, token_tag_action_18)
     40 => (78, token_tag_action_18)
     _ => (-1, [])
   }
 }
fn token_state_78(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     9..=10 => (81, token_tag_action_18)
     13 => (81, token_tag_action_18)
     32 => (81, token_tag_action_18)
     _ => (-1, [])
   }
 }
fn token_state_79(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     9..=10 => (77, token_tag_action_18)
     13 => (77, token_tag_action_18)
     32 => (77, token_tag_action_18)
     40 => (78, token_tag_action_18)
     48..=57 => (79, token_tag_action_16)
     65..=90 => (79, token_tag_action_16)
     95 => (79, token_tag_action_16)
     97..=122 => (79, token_tag_action_16)
     _ => (-1, [])
   }
 }
fn token_state_80(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     _ => (-1, [])
   }
 }
fn token_state_81(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     9..=10 => (81, token_tag_action_18)
     13 => (81, token_tag_action_18)
     32 => (81, token_tag_action_18)
     _ => (-1, [])
   }
 }

let __mbtlex_engine_token: LexEngine = { graph: [token_state_0, token_state_1, token_state_2, token_state_3, token_state_4, token_state_5, token_state_6, token_state_7, token_state_8, token_state_9, token_state_10, token_state_11, token_state_12, token_state_13, token_state_14, token_state_15, token_state_16, token_state_17, token_state_18, token_state_19, token_state_20, token_state_21, token_state_22, token_state_23, token_state_24, token_state_25, token_state_26, token_state_27, token_state_28, token_state_29, token_state_30, token_state_31, token_state_32, token_state_33, token_state_34, token_state_35, token_state_36, token_state_37, token_state_38, token_state_39, token_state_40, token_state_41, token_state_42, token_state_43, token_state_44, token_state_45, token_state_46, token_state_47, token_state_48, token_state_49, token_state_50, token_state_51, token_state_52, token_state_53, token_state_54, token_state_55, token_state_56, token_state_57, token_state_58, token_state_59, token_state_60, token_state_61, token_state_62, token_state_63, token_state_64, token_state_65, token_state_66, token_state_67, token_state_68, token_state_69, token_state_70, token_state_71, token_state_72, token_state_73, token_state_74, token_state_75, token_state_76, token_state_77, token_state_78, token_state_79, token_state_80, token_state_81, ], end_nodes: [None, Some((35, [((10, 0), (11, 0))])), Some((0, [])), Some((34, [])), None, Some((22, [])), Some((21, [])), Some((20, [])), Some((19, [])), Some((18, [])), Some((17, [])), Some((15, [])), Some((14, [])), Some((13, [])), Some((12, [])), Some((11, [])), Some((10, [])), Some((9, [])), Some((8, [])), Some((7, [])), Some((35, [((10, 0), (11, 0))])), Some((35, [((10, 0), (11, 0))])), Some((35, [((10, 0), (11, 0))])), Some((35, [((10, 0), (11, 0))])), Some((35, [((10, 0), (11, 0))])), None, Some((35, [((10, 0), (11, 0))])), None, None, Some((16, [])), Some((6, [])), Some((35, [((10, 0), (11, 0))])), Some((35, [((10, 0), (11, 0))])), Some((35, [((10, 0), (11, 0))])), Some((35, [((10, 0), (11, 0))])), Some((1, [])), Some((23, [((2, 0), (3, 0))])), None, None, None, None, None, None, None, None, None, Some((5, [])), Some((35, [((10, 0), (11, 0))])), Some((35, [((10, 0), (11, 0))])), Some((2, [])), Some((1, [])), Some((1, [])), Some((24, [])), Some((26, [])), Some((30, [])), Some((25, [])), None, Some((27, [])), Some((28, [])), None, None, Some((29, [])), Some((35, [((10, 0), (11, 0))])), Some((35, [((10, 0), (11, 0))])), None, None, None, Some((35, [((10, 0), (11, 0))])), None, Some((31, [((4, 0), (5, 0))])), None, None, None, Some((4, [])), None, Some((33, [((8, 0), (9, 0))])), None, None, Some((3, [((0, 0), (1, 0))])), None, Some((32, [((6, 0), (7, 0))])), Some((3, [((0, 0), (1, 0))]))], start_tags: [10], code_blocks_n: 36 }
fn token( lexbuf : Lexbuf ) ->  Token  {
 match __mbtlex_engine_token.run(lexbuf) {
 (0, __mbtlex_captures) => {
  token(lexbuf) 
 }
 (1, __mbtlex_captures) => {
  token(lexbuf) 
 }
 (2, __mbtlex_captures) => {
  EOF 
 }
 (3, __mbtlex_captures) => {
 let (_start_pos_of_t, _end_pos_of_t) = __mbtlex_captures[0]
 let t: String = lexbuf.substring(_start_pos_of_t, _end_pos_of_t)
 
 
       let buffer1 = StringBuilder::new()
       let buffer2 = StringBuilder::new()
       code_rparen(buffer1, lexbuf)
       arrow_code_lbrace(buffer2, lexbuf)
       RULE_LC_IDENT_LPAREN_CODE_RPAREN_ARROW_CODE_LBRACE((t, buffer1.to_string(), buffer2.to_string()))
     
 }
 (4, __mbtlex_captures) => {
  PARSE_LBRACE 
 }
 (5, __mbtlex_captures) => {
  LET 
 }
 (6, __mbtlex_captures) => {
  AS 
 }
 (7, __mbtlex_captures) => {
  UNDERSCORE 
 }
 (8, __mbtlex_captures) => {
  
       let buffer = StringBuilder::new()
       code_rbrace(buffer, lexbuf)
       LBRACE_CODE_RBRACE(buffer.to_string())
     
 }
 (9, __mbtlex_captures) => {
  RBRACE 
 }
 (10, __mbtlex_captures) => {
  LPAREN 
 }
 (11, __mbtlex_captures) => {
  RPAREN 
 }
 (12, __mbtlex_captures) => {
  LBRACKET 
 }
 (13, __mbtlex_captures) => {
  RBRACKET 
 }
 (14, __mbtlex_captures) => {
  EQ 
 }
 (15, __mbtlex_captures) => {
  SEMICOLON 
 }
 (16, __mbtlex_captures) => {
  FAT_ARROW 
 }
 (17, __mbtlex_captures) => {
  BAR 
 }
 (18, __mbtlex_captures) => {
  STAR 
 }
 (19, __mbtlex_captures) => {
  PLUS 
 }
 (20, __mbtlex_captures) => {
  QUESTION 
 }
 (21, __mbtlex_captures) => {
  MINUS 
 }
 (22, __mbtlex_captures) => {
  CARET 
 }
 (23, __mbtlex_captures) => {
 let (_start_pos_of_t, _end_pos_of_t) = __mbtlex_captures[0]
 let t: String = lexbuf.substring(_start_pos_of_t, _end_pos_of_t)
 
  CHAR(t[:][0]) 
 }
 (24, __mbtlex_captures) => {
  CHAR('\x08') 
 }
 (25, __mbtlex_captures) => {
  CHAR('\x09') 
 }
 (26, __mbtlex_captures) => {
  CHAR('\x0b') 
 }
 (27, __mbtlex_captures) => {
  CHAR('\x0d') 
 }
 (28, __mbtlex_captures) => {
  CHAR('\x0a') 
 }
 (29, __mbtlex_captures) => {
  CHAR('\\') 
 }
 (30, __mbtlex_captures) => {
  CHAR('\'') 
 }
 (31, __mbtlex_captures) => {
 let (_start_pos_of_t, _end_pos_of_t) = __mbtlex_captures[0]
 let t: String = lexbuf.substring(_start_pos_of_t, _end_pos_of_t)
 
 
       let code = @strconv.parse_int?(t, base=16).unwrap()
       CHAR(Char::from_int(code))
     
 }
 (32, __mbtlex_captures) => {
 let (_start_pos_of_t, _end_pos_of_t) = __mbtlex_captures[0]
 let t: String = lexbuf.substring(_start_pos_of_t, _end_pos_of_t)
 
 
       let code = @strconv.parse_int?(t, base=16).unwrap()
       CHAR(Char::from_int(code))
     
 }
 (33, __mbtlex_captures) => {
 let (_start_pos_of_t, _end_pos_of_t) = __mbtlex_captures[0]
 let t: String = lexbuf.substring(_start_pos_of_t, _end_pos_of_t)
 
 
       let code = @strconv.parse_int?(t, base=16).unwrap()
       CHAR(Char::from_int(code))
     
 }
 (34, __mbtlex_captures) => {
 
       let buffer = StringBuilder::new()
       string_inner_rquote(buffer, lexbuf)
       STRING(buffer.to_string())
     
 }
 (35, __mbtlex_captures) => {
 let (_start_pos_of_t, _end_pos_of_t) = __mbtlex_captures[0]
 let t: String = lexbuf.substring(_start_pos_of_t, _end_pos_of_t)
 
  LC_IDENT(t) 
 }
 _ => abort("lex: fail to match")
 }
 }
let string_inner_rquote_tag_action_row_0 : Array[Int] = []
let string_inner_rquote_tag_action_row_2 : Array[Int] = [-1]
let string_inner_rquote_tag_action_row_1 : Array[Int] = [0]

let string_inner_rquote_tag_action_0 : Array[Array[Int]] = [string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_0]
let string_inner_rquote_tag_action_1 : Array[Array[Int]] = [string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_1, string_inner_rquote_tag_action_row_2]
let string_inner_rquote_tag_action_5 : Array[Array[Int]] = [string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_2, string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_0]
let string_inner_rquote_tag_action_7 : Array[Array[Int]] = [string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_1, string_inner_rquote_tag_action_row_2, string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_0]
let string_inner_rquote_tag_action_9 : Array[Array[Int]] = [string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_1, string_inner_rquote_tag_action_row_1, string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_0]
let string_inner_rquote_tag_action_2 : Array[Array[Int]] = [string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_2, string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_0]
let string_inner_rquote_tag_action_4 : Array[Array[Int]] = [string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_1, string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_0]
let string_inner_rquote_tag_action_11 : Array[Array[Int]] = [string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_1, string_inner_rquote_tag_action_row_2, string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_0]
let string_inner_rquote_tag_action_12 : Array[Array[Int]] = [string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_1, string_inner_rquote_tag_action_row_1, string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_0]
let string_inner_rquote_tag_action_3 : Array[Array[Int]] = [string_inner_rquote_tag_action_row_2, string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_0]
let string_inner_rquote_tag_action_6 : Array[Array[Int]] = [string_inner_rquote_tag_action_row_1, string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_0]
let string_inner_rquote_tag_action_8 : Array[Array[Int]] = [string_inner_rquote_tag_action_row_1, string_inner_rquote_tag_action_row_2, string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_0]
let string_inner_rquote_tag_action_10 : Array[Array[Int]] = [string_inner_rquote_tag_action_row_1, string_inner_rquote_tag_action_row_1, string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_0, string_inner_rquote_tag_action_row_0]

fn string_inner_rquote_state_0(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     -1 => (1, string_inner_rquote_tag_action_0)
     0..=33 => (5, string_inner_rquote_tag_action_1)
     34 => (2, string_inner_rquote_tag_action_1)
     35..=38 => (5, string_inner_rquote_tag_action_1)
     39 => (4, string_inner_rquote_tag_action_1)
     40..=91 => (5, string_inner_rquote_tag_action_1)
     92 => (3, string_inner_rquote_tag_action_1)
     93..=1114111 => (5, string_inner_rquote_tag_action_1)
     _ => (-1, [])
   }
 }
fn string_inner_rquote_state_1(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     _ => (-1, [])
   }
 }
fn string_inner_rquote_state_2(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     _ => (-1, [])
   }
 }
fn string_inner_rquote_state_3(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     39 => (6, string_inner_rquote_tag_action_0)
     92 => (11, string_inner_rquote_tag_action_0)
     98 => (7, string_inner_rquote_tag_action_0)
     110 => (8, string_inner_rquote_tag_action_0)
     114 => (9, string_inner_rquote_tag_action_0)
     116 => (10, string_inner_rquote_tag_action_0)
     118 => (12, string_inner_rquote_tag_action_0)
     _ => (-1, [])
   }
 }
fn string_inner_rquote_state_4(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     92 => (13, string_inner_rquote_tag_action_0)
     _ => (-1, [])
   }
 }
fn string_inner_rquote_state_5(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     _ => (-1, [])
   }
 }
fn string_inner_rquote_state_6(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     _ => (-1, [])
   }
 }
fn string_inner_rquote_state_7(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     _ => (-1, [])
   }
 }
fn string_inner_rquote_state_8(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     _ => (-1, [])
   }
 }
fn string_inner_rquote_state_9(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     _ => (-1, [])
   }
 }
fn string_inner_rquote_state_10(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     _ => (-1, [])
   }
 }
fn string_inner_rquote_state_11(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     _ => (-1, [])
   }
 }
fn string_inner_rquote_state_12(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     _ => (-1, [])
   }
 }
fn string_inner_rquote_state_13(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     117 => (14, string_inner_rquote_tag_action_2)
     120 => (15, string_inner_rquote_tag_action_3)
     _ => (-1, [])
   }
 }
fn string_inner_rquote_state_14(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     48..=57 => (16, string_inner_rquote_tag_action_4)
     65..=70 => (16, string_inner_rquote_tag_action_4)
     97..=102 => (16, string_inner_rquote_tag_action_4)
     123 => (17, string_inner_rquote_tag_action_5)
     _ => (-1, [])
   }
 }
fn string_inner_rquote_state_15(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     48..=57 => (18, string_inner_rquote_tag_action_6)
     65..=70 => (18, string_inner_rquote_tag_action_6)
     97..=102 => (18, string_inner_rquote_tag_action_6)
     _ => (-1, [])
   }
 }
fn string_inner_rquote_state_16(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     48..=57 => (19, string_inner_rquote_tag_action_4)
     65..=70 => (19, string_inner_rquote_tag_action_4)
     97..=102 => (19, string_inner_rquote_tag_action_4)
     _ => (-1, [])
   }
 }
fn string_inner_rquote_state_17(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     48..=57 => (20, string_inner_rquote_tag_action_7)
     65..=70 => (20, string_inner_rquote_tag_action_7)
     97..=102 => (20, string_inner_rquote_tag_action_7)
     _ => (-1, [])
   }
 }
fn string_inner_rquote_state_18(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     48..=57 => (21, string_inner_rquote_tag_action_8)
     65..=70 => (21, string_inner_rquote_tag_action_8)
     97..=102 => (21, string_inner_rquote_tag_action_8)
     _ => (-1, [])
   }
 }
fn string_inner_rquote_state_19(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     48..=57 => (22, string_inner_rquote_tag_action_4)
     65..=70 => (22, string_inner_rquote_tag_action_4)
     97..=102 => (22, string_inner_rquote_tag_action_4)
     _ => (-1, [])
   }
 }
fn string_inner_rquote_state_20(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     48..=57 => (20, string_inner_rquote_tag_action_7)
     65..=70 => (20, string_inner_rquote_tag_action_7)
     97..=102 => (20, string_inner_rquote_tag_action_7)
     125 => (23, string_inner_rquote_tag_action_9)
     _ => (-1, [])
   }
 }
fn string_inner_rquote_state_21(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     39 => (24, string_inner_rquote_tag_action_10)
     _ => (-1, [])
   }
 }
fn string_inner_rquote_state_22(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     48..=57 => (25, string_inner_rquote_tag_action_11)
     65..=70 => (25, string_inner_rquote_tag_action_11)
     97..=102 => (25, string_inner_rquote_tag_action_11)
     _ => (-1, [])
   }
 }
fn string_inner_rquote_state_23(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     39 => (26, string_inner_rquote_tag_action_9)
     _ => (-1, [])
   }
 }
fn string_inner_rquote_state_24(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     _ => (-1, [])
   }
 }
fn string_inner_rquote_state_25(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     39 => (27, string_inner_rquote_tag_action_12)
     _ => (-1, [])
   }
 }
fn string_inner_rquote_state_26(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     _ => (-1, [])
   }
 }
fn string_inner_rquote_state_27(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     _ => (-1, [])
   }
 }

let __mbtlex_engine_string_inner_rquote: LexEngine = { graph: [string_inner_rquote_state_0, string_inner_rquote_state_1, string_inner_rquote_state_2, string_inner_rquote_state_3, string_inner_rquote_state_4, string_inner_rquote_state_5, string_inner_rquote_state_6, string_inner_rquote_state_7, string_inner_rquote_state_8, string_inner_rquote_state_9, string_inner_rquote_state_10, string_inner_rquote_state_11, string_inner_rquote_state_12, string_inner_rquote_state_13, string_inner_rquote_state_14, string_inner_rquote_state_15, string_inner_rquote_state_16, string_inner_rquote_state_17, string_inner_rquote_state_18, string_inner_rquote_state_19, string_inner_rquote_state_20, string_inner_rquote_state_21, string_inner_rquote_state_22, string_inner_rquote_state_23, string_inner_rquote_state_24, string_inner_rquote_state_25, string_inner_rquote_state_26, string_inner_rquote_state_27, ], end_nodes: [None, Some((12, [])), Some((0, [])), Some((11, [((6, 0), (7, 0))])), Some((11, [((6, 0), (7, 0))])), Some((11, [((6, 0), (7, 0))])), Some((7, [])), Some((1, [])), Some((5, [])), Some((4, [])), Some((2, [])), Some((6, [])), Some((3, [])), None, None, None, None, None, None, None, None, None, None, None, Some((8, [((0, 0), (1, 0))])), None, Some((10, [((4, 0), (5, 0))])), Some((9, [((2, 0), (3, 0))]))], start_tags: [6], code_blocks_n: 13 }
fn string_inner_rquote( buffer :  StringBuilder, lexbuf : Lexbuf ) ->  Unit  {
 match __mbtlex_engine_string_inner_rquote.run(lexbuf) {
 (0, __mbtlex_captures) => {
  () 
 }
 (1, __mbtlex_captures) => {
 
       buffer.write_char('\x08')
       string_inner_rquote(buffer, lexbuf)
     
 }
 (2, __mbtlex_captures) => {
 
       buffer.write_char('\x09')
       string_inner_rquote(buffer, lexbuf)
     
 }
 (3, __mbtlex_captures) => {
 
       buffer.write_char('\x0b')
       string_inner_rquote(buffer, lexbuf)
     
 }
 (4, __mbtlex_captures) => {
 
       buffer.write_char('\x0d')
       string_inner_rquote(buffer, lexbuf)
     
 }
 (5, __mbtlex_captures) => {
 
       buffer.write_char('\x0a')
       string_inner_rquote(buffer, lexbuf)
     
 }
 (6, __mbtlex_captures) => {
 
       buffer.write_char('\x5c')
       string_inner_rquote(buffer, lexbuf)
     
 }
 (7, __mbtlex_captures) => {
 
       buffer.write_char('\'')
       string_inner_rquote(buffer, lexbuf)
     
 }
 (8, __mbtlex_captures) => {
 let (_start_pos_of_t, _end_pos_of_t) = __mbtlex_captures[0]
 let t: String = lexbuf.substring(_start_pos_of_t, _end_pos_of_t)
 
 
       let code = @strconv.parse_int?(t, base=16).unwrap()
       buffer.write_char(Char::from_int(code))
     
 }
 (9, __mbtlex_captures) => {
 let (_start_pos_of_t, _end_pos_of_t) = __mbtlex_captures[0]
 let t: String = lexbuf.substring(_start_pos_of_t, _end_pos_of_t)
 
 
       let code = @strconv.parse_int?(t, base=16).unwrap()
       buffer.write_char(Char::from_int(code))
     
 }
 (10, __mbtlex_captures) => {
 let (_start_pos_of_t, _end_pos_of_t) = __mbtlex_captures[0]
 let t: String = lexbuf.substring(_start_pos_of_t, _end_pos_of_t)
 
 
       let code = @strconv.parse_int?(t, base=16).unwrap()
       buffer.write_char(Char::from_int(code))
     
 }
 (11, __mbtlex_captures) => {
 let (_start_pos_of_t, _end_pos_of_t) = __mbtlex_captures[0]
 let t: String = lexbuf.substring(_start_pos_of_t, _end_pos_of_t)
 
 
       buffer.write_string(t)
       string_inner_rquote(buffer, lexbuf)
     
 }
 (12, __mbtlex_captures) => {
  abort("Unexpected end of input") 
 }
 _ => abort("lex: fail to match")
 }
 }
let code_rparen_tag_action_row_0 : Array[Int] = []
let code_rparen_tag_action_row_2 : Array[Int] = [-1]
let code_rparen_tag_action_row_1 : Array[Int] = [0]

let code_rparen_tag_action_0 : Array[Array[Int]] = [code_rparen_tag_action_row_0, code_rparen_tag_action_row_0]
let code_rparen_tag_action_1 : Array[Array[Int]] = [code_rparen_tag_action_row_1, code_rparen_tag_action_row_2]

fn code_rparen_state_0(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     -1 => (2, code_rparen_tag_action_0)
     0..=39 => (1, code_rparen_tag_action_1)
     40 => (3, code_rparen_tag_action_1)
     41 => (4, code_rparen_tag_action_1)
     42..=1114111 => (1, code_rparen_tag_action_1)
     _ => (-1, [])
   }
 }
fn code_rparen_state_1(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     _ => (-1, [])
   }
 }
fn code_rparen_state_2(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     _ => (-1, [])
   }
 }
fn code_rparen_state_3(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     _ => (-1, [])
   }
 }
fn code_rparen_state_4(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     _ => (-1, [])
   }
 }

let __mbtlex_engine_code_rparen: LexEngine = { graph: [code_rparen_state_0, code_rparen_state_1, code_rparen_state_2, code_rparen_state_3, code_rparen_state_4, ], end_nodes: [None, Some((2, [((0, 0), (1, 0))])), Some((3, [])), Some((1, [])), Some((0, []))], start_tags: [0], code_blocks_n: 4 }
fn code_rparen( buffer :  StringBuilder, lexbuf : Lexbuf ) ->  Unit  {
 match __mbtlex_engine_code_rparen.run(lexbuf) {
 (0, __mbtlex_captures) => {
  () 
 }
 (1, __mbtlex_captures) => {
 
       buffer.write_string("(")
       code_rparen(buffer, lexbuf)
       buffer.write_string(")")
       code_rparen(buffer, lexbuf)
     
 }
 (2, __mbtlex_captures) => {
 let (_start_pos_of_t, _end_pos_of_t) = __mbtlex_captures[0]
 let t: String = lexbuf.substring(_start_pos_of_t, _end_pos_of_t)
 
 
       buffer.write_string(t)
       code_rbrace(buffer, lexbuf)
     
 }
 (3, __mbtlex_captures) => {
  abort("Unexpected end of input") 
 }
 _ => abort("lex: fail to match")
 }
 }
let arrow_code_lbrace_tag_action_row_0 : Array[Int] = []
let arrow_code_lbrace_tag_action_row_1 : Array[Int] = [-1]
let arrow_code_lbrace_tag_action_row_2 : Array[Int] = [0]
let arrow_code_lbrace_tag_action_row_4 : Array[Int] = [1]
let arrow_code_lbrace_tag_action_row_3 : Array[Int] = [-1, 0]
let arrow_code_lbrace_tag_action_row_5 : Array[Int] = [-1, 0, 1]

let arrow_code_lbrace_tag_action_0 : Array[Array[Int]] = [arrow_code_lbrace_tag_action_row_0, arrow_code_lbrace_tag_action_row_0]
let arrow_code_lbrace_tag_action_1 : Array[Array[Int]] = [arrow_code_lbrace_tag_action_row_1, arrow_code_lbrace_tag_action_row_0]
let arrow_code_lbrace_tag_action_2 : Array[Array[Int]] = [arrow_code_lbrace_tag_action_row_2, arrow_code_lbrace_tag_action_row_1]
let arrow_code_lbrace_tag_action_5 : Array[Array[Int]] = [arrow_code_lbrace_tag_action_row_2, arrow_code_lbrace_tag_action_row_2]
let arrow_code_lbrace_tag_action_4 : Array[Array[Int]] = [arrow_code_lbrace_tag_action_row_2, arrow_code_lbrace_tag_action_row_3]
let arrow_code_lbrace_tag_action_7 : Array[Array[Int]] = [arrow_code_lbrace_tag_action_row_4, arrow_code_lbrace_tag_action_row_2]
let arrow_code_lbrace_tag_action_3 : Array[Array[Int]] = [arrow_code_lbrace_tag_action_row_3, arrow_code_lbrace_tag_action_row_1]
let arrow_code_lbrace_tag_action_6 : Array[Array[Int]] = [arrow_code_lbrace_tag_action_row_5, arrow_code_lbrace_tag_action_row_3]

fn arrow_code_lbrace_state_0(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     0..=44 => (1, arrow_code_lbrace_tag_action_0)
     45 => (2, arrow_code_lbrace_tag_action_0)
     46..=1114111 => (1, arrow_code_lbrace_tag_action_0)
     _ => (-1, [])
   }
 }
fn arrow_code_lbrace_state_1(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     _ => (-1, [])
   }
 }
fn arrow_code_lbrace_state_2(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     62 => (3, arrow_code_lbrace_tag_action_1)
     _ => (-1, [])
   }
 }
fn arrow_code_lbrace_state_3(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     0..=8 => (4, arrow_code_lbrace_tag_action_2)
     9..=10 => (5, arrow_code_lbrace_tag_action_3)
     11..=12 => (4, arrow_code_lbrace_tag_action_2)
     13 => (5, arrow_code_lbrace_tag_action_3)
     14..=31 => (4, arrow_code_lbrace_tag_action_2)
     32 => (5, arrow_code_lbrace_tag_action_3)
     33..=122 => (4, arrow_code_lbrace_tag_action_2)
     124..=1114111 => (4, arrow_code_lbrace_tag_action_2)
     _ => (-1, [])
   }
 }
fn arrow_code_lbrace_state_4(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     0..=8 => (4, arrow_code_lbrace_tag_action_2)
     9..=10 => (6, arrow_code_lbrace_tag_action_4)
     11..=12 => (4, arrow_code_lbrace_tag_action_2)
     13 => (6, arrow_code_lbrace_tag_action_4)
     14..=31 => (4, arrow_code_lbrace_tag_action_2)
     32 => (6, arrow_code_lbrace_tag_action_4)
     33..=122 => (4, arrow_code_lbrace_tag_action_2)
     123 => (7, arrow_code_lbrace_tag_action_5)
     124..=1114111 => (4, arrow_code_lbrace_tag_action_2)
     _ => (-1, [])
   }
 }
fn arrow_code_lbrace_state_5(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     0..=8 => (4, arrow_code_lbrace_tag_action_2)
     9..=10 => (8, arrow_code_lbrace_tag_action_6)
     11..=12 => (4, arrow_code_lbrace_tag_action_2)
     13 => (8, arrow_code_lbrace_tag_action_6)
     14..=31 => (4, arrow_code_lbrace_tag_action_2)
     32 => (8, arrow_code_lbrace_tag_action_6)
     33..=122 => (4, arrow_code_lbrace_tag_action_2)
     123 => (7, arrow_code_lbrace_tag_action_7)
     124..=1114111 => (4, arrow_code_lbrace_tag_action_2)
     _ => (-1, [])
   }
 }
fn arrow_code_lbrace_state_6(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     0..=8 => (4, arrow_code_lbrace_tag_action_2)
     9..=10 => (6, arrow_code_lbrace_tag_action_4)
     11..=12 => (4, arrow_code_lbrace_tag_action_2)
     13 => (6, arrow_code_lbrace_tag_action_4)
     14..=31 => (4, arrow_code_lbrace_tag_action_2)
     32 => (6, arrow_code_lbrace_tag_action_4)
     33..=122 => (4, arrow_code_lbrace_tag_action_2)
     123 => (7, arrow_code_lbrace_tag_action_5)
     124..=1114111 => (4, arrow_code_lbrace_tag_action_2)
     _ => (-1, [])
   }
 }
fn arrow_code_lbrace_state_7(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     _ => (-1, [])
   }
 }
fn arrow_code_lbrace_state_8(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     0..=8 => (4, arrow_code_lbrace_tag_action_2)
     9..=10 => (8, arrow_code_lbrace_tag_action_6)
     11..=12 => (4, arrow_code_lbrace_tag_action_2)
     13 => (8, arrow_code_lbrace_tag_action_6)
     14..=31 => (4, arrow_code_lbrace_tag_action_2)
     32 => (8, arrow_code_lbrace_tag_action_6)
     33..=122 => (4, arrow_code_lbrace_tag_action_2)
     123 => (7, arrow_code_lbrace_tag_action_7)
     124..=1114111 => (4, arrow_code_lbrace_tag_action_2)
     _ => (-1, [])
   }
 }

let __mbtlex_engine_arrow_code_lbrace: LexEngine = { graph: [arrow_code_lbrace_state_0, arrow_code_lbrace_state_1, arrow_code_lbrace_state_2, arrow_code_lbrace_state_3, arrow_code_lbrace_state_4, arrow_code_lbrace_state_5, arrow_code_lbrace_state_6, arrow_code_lbrace_state_7, arrow_code_lbrace_state_8, ], end_nodes: [None, Some((1, [])), Some((1, [])), None, None, None, None, Some((0, [((0, 0), (1, 0))])), None], start_tags: [], code_blocks_n: 2 }
fn arrow_code_lbrace( buffer :  StringBuilder, lexbuf : Lexbuf ) ->  Unit  {
 match __mbtlex_engine_arrow_code_lbrace.run(lexbuf) {
 (0, __mbtlex_captures) => {
 let (_start_pos_of_t, _end_pos_of_t) = __mbtlex_captures[0]
 let t: String = lexbuf.substring(_start_pos_of_t, _end_pos_of_t)
 
 
       buffer.write_string(t)
     
 }
 (1, __mbtlex_captures) => {
  abort("Syntax error") 
 }
 _ => abort("lex: fail to match")
 }
 }
let code_rbrace_tag_action_row_0 : Array[Int] = []
let code_rbrace_tag_action_row_2 : Array[Int] = [-1]
let code_rbrace_tag_action_row_1 : Array[Int] = [0]

let code_rbrace_tag_action_0 : Array[Array[Int]] = [code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0]
let code_rbrace_tag_action_1 : Array[Array[Int]] = [code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_1, code_rbrace_tag_action_row_2]
let code_rbrace_tag_action_4 : Array[Array[Int]] = [code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_1, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0]
let code_rbrace_tag_action_2 : Array[Array[Int]] = [code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_1, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_1, code_rbrace_tag_action_row_2]
let code_rbrace_tag_action_5 : Array[Array[Int]] = [code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_1, code_rbrace_tag_action_row_2, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0]
let code_rbrace_tag_action_6 : Array[Array[Int]] = [code_rbrace_tag_action_row_1, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0]
let code_rbrace_tag_action_3 : Array[Array[Int]] = [code_rbrace_tag_action_row_1, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_1, code_rbrace_tag_action_row_2]
let code_rbrace_tag_action_7 : Array[Array[Int]] = [code_rbrace_tag_action_row_1, code_rbrace_tag_action_row_2, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0]

fn code_rbrace_state_0(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     -1 => (1, code_rbrace_tag_action_0)
     0..=33 => (6, code_rbrace_tag_action_1)
     34 => (2, code_rbrace_tag_action_2)
     35..=46 => (6, code_rbrace_tag_action_1)
     47 => (5, code_rbrace_tag_action_3)
     48..=122 => (6, code_rbrace_tag_action_1)
     123 => (3, code_rbrace_tag_action_1)
     124 => (6, code_rbrace_tag_action_1)
     125 => (4, code_rbrace_tag_action_1)
     126..=1114111 => (6, code_rbrace_tag_action_1)
     _ => (-1, [])
   }
 }
fn code_rbrace_state_1(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     _ => (-1, [])
   }
 }
fn code_rbrace_state_2(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     0..=33 => (8, code_rbrace_tag_action_4)
     34 => (9, code_rbrace_tag_action_5)
     35..=91 => (8, code_rbrace_tag_action_4)
     92 => (7, code_rbrace_tag_action_4)
     93..=1114111 => (8, code_rbrace_tag_action_4)
     _ => (-1, [])
   }
 }
fn code_rbrace_state_3(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     _ => (-1, [])
   }
 }
fn code_rbrace_state_4(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     _ => (-1, [])
   }
 }
fn code_rbrace_state_5(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     47 => (10, code_rbrace_tag_action_6)
     _ => (-1, [])
   }
 }
fn code_rbrace_state_6(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     _ => (-1, [])
   }
 }
fn code_rbrace_state_7(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     0..=1114111 => (11, code_rbrace_tag_action_4)
     _ => (-1, [])
   }
 }
fn code_rbrace_state_8(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     0..=33 => (8, code_rbrace_tag_action_4)
     34 => (9, code_rbrace_tag_action_5)
     35..=91 => (8, code_rbrace_tag_action_4)
     92 => (7, code_rbrace_tag_action_4)
     93..=1114111 => (8, code_rbrace_tag_action_4)
     _ => (-1, [])
   }
 }
fn code_rbrace_state_9(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     _ => (-1, [])
   }
 }
fn code_rbrace_state_10(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     0..=9 => (12, code_rbrace_tag_action_6)
     11..=1114111 => (12, code_rbrace_tag_action_6)
     _ => (-1, [])
   }
 }
fn code_rbrace_state_11(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     0..=33 => (8, code_rbrace_tag_action_4)
     34 => (9, code_rbrace_tag_action_5)
     35..=91 => (8, code_rbrace_tag_action_4)
     92 => (7, code_rbrace_tag_action_4)
     93..=1114111 => (8, code_rbrace_tag_action_4)
     _ => (-1, [])
   }
 }
fn code_rbrace_state_12(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     0..=9 => (12, code_rbrace_tag_action_6)
     10 => (13, code_rbrace_tag_action_7)
     11..=1114111 => (12, code_rbrace_tag_action_6)
     _ => (-1, [])
   }
 }
fn code_rbrace_state_13(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     _ => (-1, [])
   }
 }

let __mbtlex_engine_code_rbrace: LexEngine = { graph: [code_rbrace_state_0, code_rbrace_state_1, code_rbrace_state_2, code_rbrace_state_3, code_rbrace_state_4, code_rbrace_state_5, code_rbrace_state_6, code_rbrace_state_7, code_rbrace_state_8, code_rbrace_state_9, code_rbrace_state_10, code_rbrace_state_11, code_rbrace_state_12, code_rbrace_state_13, ], end_nodes: [None, Some((5, [])), Some((4, [((4, 0), (5, 0))])), Some((2, [])), Some((3, [])), Some((4, [((4, 0), (5, 0))])), Some((4, [((4, 0), (5, 0))])), None, None, Some((1, [((2, 0), (3, 0))])), None, None, None, Some((0, [((0, 0), (1, 0))]))], start_tags: [0, 2, 4], code_blocks_n: 6 }
fn code_rbrace( buffer :  StringBuilder, lexbuf : Lexbuf ) ->  Unit  {
 match __mbtlex_engine_code_rbrace.run(lexbuf) {
 (0, __mbtlex_captures) => {
 let (_start_pos_of_t, _end_pos_of_t) = __mbtlex_captures[0]
 let t: String = lexbuf.substring(_start_pos_of_t, _end_pos_of_t)
 
 
       buffer.write_string(t)
       code_rbrace(buffer, lexbuf)
     
 }
 (1, __mbtlex_captures) => {
 let (_start_pos_of_t, _end_pos_of_t) = __mbtlex_captures[0]
 let t: String = lexbuf.substring(_start_pos_of_t, _end_pos_of_t)
 
 
       buffer.write_string(t)
       code_rbrace(buffer, lexbuf)
     
 }
 (2, __mbtlex_captures) => {
 
       buffer.write_string("{")
       code_rbrace(buffer, lexbuf)
       buffer.write_string("}")
       code_rbrace(buffer, lexbuf)
     
 }
 (3, __mbtlex_captures) => {
  () 
 }
 (4, __mbtlex_captures) => {
 let (_start_pos_of_t, _end_pos_of_t) = __mbtlex_captures[0]
 let t: String = lexbuf.substring(_start_pos_of_t, _end_pos_of_t)
 
 
       buffer.write_string(t)
       code_rbrace(buffer, lexbuf)
     
 }
 (5, __mbtlex_captures) => {
  abort("Unexpected end of input") 
 }
 _ => abort("lex: fail to match")
 }
 }

