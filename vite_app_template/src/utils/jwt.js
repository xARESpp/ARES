function decodeJWT(token) {
    try {
      const payload = token.split('.')[1]; // 取出中间部分 (Payload)
      const decoded = JSON.parse(atob(payload)); // Base64 解码并解析 JSON
      console.log(decoded.user_id)
      return decoded.user_id || null; // 提取用户名
    } catch (error) {
      console.error('Failed to decode token:', error);
      return null;
    }
  }

//   function decodeJWT(token) {
//     try {
//       const payload = token.split('.')[1]; // 取出中间部分 (Payload)
//       const decoded = JSON.parse(atob(payload)); // Base64 解码并解析 JSON
//       console.log(decoded)
//       return decoded
//     } catch (error) {
//       console.error('Failed to decode token:', error);
//       return null;
//     }
//   }

  export default decodeJWT;
  
